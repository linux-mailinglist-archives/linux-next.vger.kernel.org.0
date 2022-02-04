Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD6C4A977E
	for <lists+linux-next@lfdr.de>; Fri,  4 Feb 2022 11:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358219AbiBDKKj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Feb 2022 05:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358179AbiBDKKg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Feb 2022 05:10:36 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA18C061714
        for <linux-next@vger.kernel.org>; Fri,  4 Feb 2022 02:10:36 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso12645550pjv.1
        for <linux-next@vger.kernel.org>; Fri, 04 Feb 2022 02:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WLQwysGpCKqiCJ2atU4zx3uV+He32VYy/1E+/ETSYII=;
        b=wXaelrmX9yqQZdJXxEaQRplgZhi0T270jTY4sPGZi9lu+un9lL1MxYklWe47v+qsMH
         1NWFTRkVr4coNMMP/32jyRIo6774cBAOMRGORqzof8k/ytrup0Q/Q30YRkWe0+tOZdnK
         VDsDnZp/r04gWvyXodhrTb7WjiCSE/nGyxibsS6hIvZ5dXmO570mI41bHYDInFn6oH9R
         X8ltYCplTHk1jvo/8CS7yWVwrYEmk8E3DqB01ENGs9o9Adh5f6Y/dV9fgwZjXdNGQAL5
         DkwnQn0jrDeFIuRDjlgnaw7LvNckUyWD81cU+cGMDIdqJCsZde4zfdGtSYylOswktecd
         vC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WLQwysGpCKqiCJ2atU4zx3uV+He32VYy/1E+/ETSYII=;
        b=uawshBATQMjOI1S6vz7CiwsGxojRP3Keb/6MRg+vV/BnYY+ft/BTV1+cXxCEHASZd/
         UheTbuEJk96WrpjxFpoiyosbi8L1JQEys6G6NkceVK81MsP+oAzfTn8LyyCAVylRa1H/
         4SpHmYm2Y5vmTSv/VZ/hDTJhW5m0rjGfgD/A+V4aH5mWYstvyjJQt9gjIZFUA0kW+hh5
         8MRY1Lf1A5O1bTEtwWMzRPqyHWOgtCIJYHPck/KOE8wt5KJWN2SvyI6iUBDZvx6Yai39
         DUJas//5OoUVf1boj1108u7jRAlrp6mCMHkhaXKU3xsqQkITVdAZgIPBBNaovPEnrFfc
         EbfQ==
X-Gm-Message-State: AOAM5338sKVbTLPDbi7QFY14kJv1B7jAaacgcdlHz/a8VQVn75t7aQ7W
        GbJ5ytZXbRq4HeJgpPuUnS8GzSfOEtOn64cR
X-Google-Smtp-Source: ABdhPJyiWgVXuayqLxoeeRr8m8izQcNHCc6EEv+N4opJ8GpWSCDHc8uOPw0Q+jpqea+ESxOE+artug==
X-Received: by 2002:a17:90b:b0d:: with SMTP id bf13mr2237980pjb.31.1643969435164;
        Fri, 04 Feb 2022 02:10:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h5sm2092051pfi.111.2022.02.04.02.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:10:34 -0800 (PST)
Message-ID: <61fcfb9a.1c69fb81.45d6a.552a@mx.google.com>
Date:   Fri, 04 Feb 2022 02:10:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220204
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 690 runs, 17 regressions (next-20220204)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 690 runs, 17 regressions (next-20220204)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 2          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 2          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+ima                | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-14 | multi_v7_=
defconfig           | 2          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 2          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220204/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220204
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ef6b35306dd8f15a7e5e5a2532e665917a43c5d9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/61fcc2b0b277a760365d6f08

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fcc2b0b277a76=
0365d6f0f
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-04T06:07:37.684421  <8>[   37.064123] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-04T06:07:37.714452  kern  :alert : 8<--- cut here ---
    2022-02-04T06:07:37.718253  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-04T06:07:37.729961  kern  :alert : [000001a0] *pgd=3Dbcdcf835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fcc2b0b277a76=
0365d6f10
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220201)
        83 lines

    2022-02-04T06:07:37.738008  kern  :alert : Register<8>[   37.115875] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-04T06:07:37.738221   r0 information: NULL pointer
    2022-02-04T06:07:37.743601  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-04T06:07:37.753095  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-04T06:07:37.759535  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-04T06:07:37.767585  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4d80800 pointer offset 64 size 1024
    2022-02-04T06:07:37.769097  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-04T06:07:37.783584  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4d80800 pointer offset 608 size 1024
    2022-02-04T06:07:37.785285  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4d80800 pointer offset 64 size 1024
    2022-02-04T06:07:37.799530  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024 =

    ... (45 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/61fcc46dcff16fbb085d6f3f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fcc46dcff16fb=
b085d6f46
        new failure (last pass: next-20220128)
        16 lines

    2022-02-04T06:14:59.733183  <8>[   37.234538] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-04T06:14:59.764137  kern  :alert : 8<--- cut here ---
    2022-02-04T06:14:59.772197  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fcc46dcff16fb=
b085d6f47
        new failure (last pass: next-20220128)
        54 lines

    2022-02-04T06:14:59.784342  kern  :alert : [000001a0] *pgd=3Dbc<8>[   3=
7.284948] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-04T06:14:59.784753  a16835
    2022-02-04T06:14:59.789247  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-04T06:14:59.794724  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-04T06:14:59.800458  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-04T06:14:59.805730  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-04T06:14:59.814096  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4523400 pointer offset 64 size 1024
    2022-02-04T06:14:59.821822  kern  :alert : Register r5 information: sla=
b task_struct start c4195500 pointer offset 0
    2022-02-04T06:14:59.830678  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024
    2022-02-04T06:14:59.839368  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4523400 pointer offset 128 size 1024 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/61fccb9d38634422715d6ee8

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fccb9d3863442=
2715d6eef
        new failure (last pass: next-20220125)
        16 lines

    2022-02-04T06:45:39.371475  <8>[   38.311845] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-04T06:45:39.400511  kern  :alert : 8<--- cut here ---
    2022-02-04T06:45:39.408694  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fccb9d3863442=
2715d6ef0
        new failure (last pass: next-20220125)
        54 lines

    2022-02-04T06:45:39.420997  kern  :alert : [00000188] *pgd=3Dbc<8>[   3=
8.358768] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-04T06:45:39.421177  b3f835
    2022-02-04T06:45:39.425612  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-04T06:45:39.431173  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-04T06:45:39.436897  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-04T06:45:39.441878  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-04T06:45:39.450503  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c444b000 pointer offset 64 size 1024
    2022-02-04T06:45:39.458159  kern  :alert : Register r5 information: sla=
b task_struct start c4425e00 pointer offset 0
    2022-02-04T06:45:39.466869  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c214b000 pointer offset 16 size 1024
    2022-02-04T06:45:39.475689  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c444b000 pointer offset 120 size 1024 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/61fcc66f0d21b6c96c5d6ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fcc66f0d21b6c96c5d6=
eea
        new failure (last pass: next-20220202) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61fcc5d191249ad2535d6f16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fcc5d191249ad2535d6=
f17
        new failure (last pass: next-20220203) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61fcc9ef297d10ed975d6f21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fcc9ef297d10ed975d6=
f22
        failing since 1 day (last pass: next-20220201, first fail: next-202=
20202) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61fcc4cf0bce2320605d6f81

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61fcc4cf0bce2320605d6fa3
        failing since 11 days (last pass: next-20220121, first fail: next-2=
0220124)

    2022-02-04T06:16:28.620432  <8>[   22.569430] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-02-04T06:16:28.964769  <4>[   22.912805] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-02-04T06:16:29.654360  /lava-5611089/1/../bin/lava-test-case
    2022-02-04T06:16:29.664908  <8>[   23.613754] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61fcc32b03bab0acce5d6f1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fcc32b03bab0acce5d6=
f1f
        new failure (last pass: next-20220203) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-14 | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/61fcc908a79d8b951d5d6eef

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fcc908a79d8b9=
51d5d6ef6
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-04T06:34:11.811201  kern  :alert : 8<--- cut here ---
    2022-02-04T06:34:11.822092  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-04T06:34:11.822479  kern  :alert : [000001a0] *pgd=3D7d560835
    2022-02-04T06:34:11.831275  kern  :alert : Register[   45.368890] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fcc908a79d8b9=
51d5d6ef7
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220201)
        83 lines

    2022-02-04T06:34:11.836703   r0 information: NULL pointer
    2022-02-04T06:34:11.842211  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-04T06:34:11.845819  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-04T06:34:11.851290  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-04T06:34:11.862234  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4c99800 pointer offset 64 size 1024
    2022-02-04T06:34:11.865902  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-04T06:34:11.876855  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4c99800 pointer offset 608 size 1024
    2022-02-04T06:34:11.882325  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4c99800 pointer offset 64 size 1024
    2022-02-04T06:34:11.891450  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-04T06:34:11.896873  kern  :alert : Register r9 information: non=
-paged memory =

    ... (43 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/61fcc98094bc2ba71e5d6ef8

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fcc98094bc2ba=
71e5d6eff
        new failure (last pass: next-20220125)
        16 lines

    2022-02-04T06:36:32.383206  kern  :alert : 8<--- cut here ---
    2022-02-04T06:36:32.394074  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-04T06:36:32.394451  kern  :alert : [000001a0] *pgd=3D7d3d8835
    2022-02-04T06:36:32.403320  kern  :alert : Register[   44.899406] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fcc98094bc2ba=
71e5d6f00
        new failure (last pass: next-20220125)
        54 lines

    2022-02-04T06:36:32.408711   r0 information: NULL pointer
    2022-02-04T06:36:32.414189  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-04T06:36:32.417968  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-04T06:36:32.423441  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-04T06:36:32.434359  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c45a5400 pointer offset 64 size 1024
    2022-02-04T06:36:32.438138  kern  :alert : Register r5 information: sla=
b task_struct start c227bb80 pointer offset 0
    2022-02-04T06:36:32.449102  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-04T06:36:32.458294  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c45a5400 pointer offset 128 size 1024
    2022-02-04T06:36:32.463840  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-04T06:36:32.474721  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/61fccac1f39dace0795d6efd

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220204/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fccac1f39dace=
0795d6f04
        new failure (last pass: next-20220125)
        16 lines

    2022-02-04T06:41:51.154104  kern  :alert : 8<--- cut here ---
    2022-02-04T06:41:51.164986  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-04T06:41:51.174181  kern  :alert : [00000188] *pgd=3D7d[   44.3=
82370] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-04T06:41:51.174553  366835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fccac1f39dace=
0795d6f05
        new failure (last pass: next-20220125)
        54 lines

    2022-02-04T06:41:51.179647  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-04T06:41:51.185090  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-04T06:41:51.188645  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-04T06:41:51.194206  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-04T06:41:51.205119  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c449d000 pointer offset 64 size 1024
    2022-02-04T06:41:51.214212  kern  :alert : Register r5 information: sla=
b task_struct start c27ef480 pointer offset 0
    2022-02-04T06:41:51.219674  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 16 size 1024
    2022-02-04T06:41:51.228799  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c449d000 pointer offset 120 size 1024
    2022-02-04T06:41:51.234342  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-04T06:41:51.245248  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =20
