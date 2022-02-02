Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334FC4A6E6E
	for <lists+linux-next@lfdr.de>; Wed,  2 Feb 2022 11:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiBBKL5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Feb 2022 05:11:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbiBBKL4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2022 05:11:56 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648F7C061714
        for <linux-next@vger.kernel.org>; Wed,  2 Feb 2022 02:11:56 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id e16so17930065pgn.4
        for <linux-next@vger.kernel.org>; Wed, 02 Feb 2022 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cVeaFpISBcLydBizkK2RPIymasjT1eAYuih0SHVqEV8=;
        b=09O7vh7gq1zfmPp/EZf6fN5r+goKqzy7xbFilzOzte2nQ+ABKAkxDLpnbl3eOEPufa
         vsngEtW2XSyI9kk1T1GUNG1DR+bEUTV4VX1iuIRij/xJ8I5yFY6deZ6NNji7Qz1HwV1c
         QBPQnH92jGhD4kl/QiNMp2zjF0WfOgmJTsrhGREBeDOSylXpD6ZhOMZUYkQGXDkUi2p6
         vwuF56tYbURf+0eexbdihvhrTJ430f3Q0K3jA+pXUxWQm+PYgIup5WfviQ+E4YTB8W2L
         vkeQMC8KAZyCKBPS8HKFBfX+X223/HnNsBuo+nkx8t9s6mYw0bq0daQuf6fqkI5uWlAh
         flOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cVeaFpISBcLydBizkK2RPIymasjT1eAYuih0SHVqEV8=;
        b=Z2bq5OoS742Uoz0uBPAYXBrF6Nt9fmWvmGftRKBlVgDm54bxhU8OceabKue63tdf9R
         KNSafkH7zNpcPlY8CM8ZjYhylVvHL9MzHljK2+h+5XMfFy0BE8J9OaE/Xfk1VNpLR72w
         YCE0xcb/NZ0HdDdgb0txcI9AJNloNJ3Ui4X9BpLt9TnE6rYqGV/jiGYpHMavVYU0f989
         3nlwjhogUAYoGH6taujHzFB0tysebGBZpie05VwwOFHYh8EqaiRRQhUYkBCJbAACyXor
         1bF+/cGcIuw+VmVk+KE6mTrQrqauA4SVX44Xfbzy//0xrtNIw7Xka4ICKjyIwoqEBjff
         Jrdw==
X-Gm-Message-State: AOAM530GGrzeRaiOVeuFVUT7Yv+SsXtdE3jUv8Yt6iCV8XH01LtZztb2
        8qnca/F3xF32SNadY29cC5Oi+z1PMGnQOynR
X-Google-Smtp-Source: ABdhPJwoPK3i+k0bM8vc8A/VWWuv3BYbzcOnlhIi7jDNUJvZC2d1pqpt68XCz2+ZRFsNwjUfVQf93g==
X-Received: by 2002:a63:d853:: with SMTP id k19mr24007152pgj.39.1643796715579;
        Wed, 02 Feb 2022 02:11:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u17sm33603706pgi.14.2022.02.02.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 02:11:55 -0800 (PST)
Message-ID: <61fa58eb.1c69fb81.30cf6.a729@mx.google.com>
Date:   Wed, 02 Feb 2022 02:11:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220202
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 688 runs, 13 regressions (next-20220202)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 688 runs, 13 regressions (next-20220202)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220202/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220202
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6abab1b81b657ca74b7c443e832d95c87901e75b =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa247d54e55a0a795d6f0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa247d54e55a0a795d6=
f0d
        failing since 9 days (last pass: next-20220121, first fail: next-20=
220124) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61fa2678ece9f6121a5d6f12

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fa2679ece9f61=
21a5d6f19
        failing since 0 day (last pass: next-20220127, first fail: next-202=
20201)
        16 lines

    2022-02-02T06:36:30.706067  kern  :alert : 8<--- cut here ---
    2022-02-02T06:36:30.714074  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-02T06:36:30.717613  kern  :alert : [000001a0] *pgd=3Dbc955835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fa2679ece9f61=
21a5d6f1a
        failing since 0 day (last pass: next-20220127, first fail: next-202=
20201)
        55 lines

    2022-02-02T06:36:30.729100  kern  :alert : Register<8>[   37.062063] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-02T06:36:30.730880   r0 information: NULL pointer
    2022-02-02T06:36:30.736483  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-02T06:36:30.742184  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-02T06:36:30.747159  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-02T06:36:30.755907  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c46f2800 pointer offset 64 size 1024
    2022-02-02T06:36:30.763806  kern  :alert : Register r5 information: sla=
b task_struct start c40b9100 pointer offset 0
    2022-02-02T06:36:30.772285  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024
    2022-02-02T06:36:30.781110  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c46f2800 pointer offset 128 size 1024
    2022-02-02T06:36:30.786697  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa299f129320e6175d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa299f129320e6175d6=
ee9
        failing since 50 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa344b0e784307d15d6eea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa344b0e784307d15d6=
eeb
        failing since 50 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa26e01e084978b05d6ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa26e01e084978b05d6=
ef4
        failing since 50 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa29f0d02ca634cd5d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa29f0d02ca634cd5d6=
ee9
        failing since 48 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa3501e00044fed55d6ef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa3501e00044fed55d6=
ef7
        failing since 48 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa26e21e084978b05d6ef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa26e21e084978b05d6=
efa
        failing since 48 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa272e342c30e19a5d6f04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa272e342c30e19a5d6=
f05
        new failure (last pass: next-20220201) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa200e8ed2970f5d5d6ee9

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61fa200e8ed2970f5d5d6f0b
        failing since 9 days (last pass: next-20220121, first fail: next-20=
220124)

    2022-02-02T06:09:00.285135  <4>[   22.893130] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-02-02T06:09:00.814614  /lava-5591877/1/../bin/lava-test-case
    2022-02-02T06:09:00.826327  <8>[   23.435590] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61fa24b1d4964acb0e5d6f5b

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fa24b1d4964ac=
b0e5d6f62
        failing since 0 day (last pass: next-20220127, first fail: next-202=
20201)
        16 lines

    2022-02-02T06:28:33.504868  kern  :alert : 8<--- cut here ---
    2022-02-02T06:28:33.515803  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-02T06:28:33.524980  kern  :alert : [000001a0] *pgd=3D7d[   43.2=
22464] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-02T06:28:33.525367  10f835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fa24b1d4964ac=
b0e5d6f63
        failing since 0 day (last pass: next-20220127, first fail: next-202=
20201)
        55 lines

    2022-02-02T06:28:33.530526  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-02T06:28:33.535900  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-02T06:28:33.539590  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-02T06:28:33.545151  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-02T06:28:33.555991  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c445ec00 pointer offset 64 size 1024
    2022-02-02T06:28:33.565228  kern  :alert : Register r5 information: sla=
b task_struct start c40b2200 pointer offset 0
    2022-02-02T06:28:33.570712  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-02T06:28:33.579810  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c445ec00 pointer offset 128 size 1024
    2022-02-02T06:28:33.585345  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-02T06:28:33.596240  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (42 line(s) more)  =

 =20
