Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF804AB8CA
	for <lists+linux-next@lfdr.de>; Mon,  7 Feb 2022 11:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233912AbiBGKfo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Feb 2022 05:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352364AbiBGKV2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Feb 2022 05:21:28 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77B6C043188
        for <linux-next@vger.kernel.org>; Mon,  7 Feb 2022 02:21:23 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso20013656pjv.1
        for <linux-next@vger.kernel.org>; Mon, 07 Feb 2022 02:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+aStN97QtUDOx6VlIs/kvcR4yhtXvHGdPmpKP2I3yhU=;
        b=CjMlasJzhwHIssypA+L7qyqUwa1FE1Ym2lofllArdG6pnxTV73j5TNXbLrzsOoRx0s
         Adh9TrYVZ7IwvIrxcTYmJ2Eynjg+9U7WymKGij8IEPoPiYKjoMa9gPftDR5oizTmAJii
         Y5gh3IuvjPzKqQLlWyoaYJWyOvct4tXnYHSmg20BiHJdtfrIMsBg25AOYUWDIjXKzBKP
         MwTW6Jou9SDBEp0Xq4MkbhlN56st/DtOK9Qz4uEbB/wcjwWsBTESf0JH/FIocGgTsyNA
         JrdWOGX/cbWmgUkel5MQEdfOoQqh8O0ky2hQNWT17k4ZoXBcdNGPZVJEratx0YP7DBwU
         UJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+aStN97QtUDOx6VlIs/kvcR4yhtXvHGdPmpKP2I3yhU=;
        b=VLezN1HIiaBqQR7c8KzxkUb6uGbYVbTSMXZt8aZad7mscZynkwor3KIQisXX25scox
         NtWxZbPjUd8Lm4BDqSMPLNX+FoTjhLnyNG8priSYTeDywsGRE9qP6JR6kzq9bbK8yiqh
         jpdz0LnatcRQsRYkVJ2ewMYxfpX6Bp27WUHZJNZ14hsWKbVLxydvXt2A7p3qfQfMaS47
         nWY+SuOpYeOSHz94uLFWO9j8rZViwb7L1UnBRJ0A7GChuXb3BK2Lcvx1qKSyWXgQcujm
         ZkPDbR+q+ywFHiF0YFi/Pd16TA7/M4iRMBHLj/DJVTOttXpo+duYCT+NZPMX+lXYtjvq
         BwoA==
X-Gm-Message-State: AOAM530Q2Lfh/pGD2Umm8b4qXNR31mxxwvEr3/t78jIFwxnyi/6ybV0v
        Hhw1ZDoSk7rsdLnabo02UEiPh4Jw2bNwVih5
X-Google-Smtp-Source: ABdhPJxWmai6OvH4fJC7ibFNyi/h1T7TpO5iUw28d9U1HaV7wD/uh8lJ/CAZ/N32EH0EcbtfMb3ANQ==
X-Received: by 2002:a17:90b:1d84:: with SMTP id pf4mr17637447pjb.106.1644229282567;
        Mon, 07 Feb 2022 02:21:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id pc4sm11159464pjb.3.2022.02.07.02.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 02:21:22 -0800 (PST)
Message-ID: <6200f2a2.1c69fb81.9d1e.acc7@mx.google.com>
Date:   Mon, 07 Feb 2022 02:21:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220207
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 804 runs, 34 regressions (next-20220207)
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

next/master baseline: 804 runs, 34 regressions (next-20220207)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | clang-14 | multi_v=
7_defconfig           | 2          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

i945gsex-qs                  | i386  | lab-clabbe      | clang-14 | i386_de=
fconfig               | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

qemu_i386                    | i386  | lab-baylibre    | clang-14 | i386_de=
fconfig               | 1          =

qemu_i386                    | i386  | lab-broonie     | clang-14 | i386_de=
fconfig               | 1          =

qemu_i386                    | i386  | lab-cip         | clang-14 | i386_de=
fconfig               | 1          =

qemu_i386                    | i386  | lab-linaro-lkft | clang-14 | i386_de=
fconfig               | 1          =

qemu_i386-uefi               | i386  | lab-baylibre    | clang-14 | i386_de=
fconfig               | 1          =

qemu_i386-uefi               | i386  | lab-broonie     | clang-14 | i386_de=
fconfig               | 1          =

qemu_i386-uefi               | i386  | lab-cip         | clang-14 | i386_de=
fconfig               | 1          =

qemu_i386-uefi               | i386  | lab-linaro-lkft | clang-14 | i386_de=
fconfig               | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-14 | multi_v=
7_defconfig           | 2          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 2          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220207/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220207
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b3c0a155ef77550d48f6eb7c6fdd6075764a5622 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | clang-14 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6200bf08ee6ac7cf5f5d6efa

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200bf08ee6ac7c=
f5f5d6f01
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-07T06:41:02.393135  kern  :alert : 8<--- cut here ---
    2022-02-07T06:41:02.401120  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-07T06:41:02.404721  kern  :alert : [000001a0] *pgd=3Dbcdba835
    2022-02-07T06:41:02.409486  kern  :alert : Register r0 information: NUL=
L pointer   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200bf08ee6ac7c=
f5f5d6f02
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        83 lines

    2022-02-07T06:41:02.418715  ke<8>[   37.053404] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-02-07T06:41:02.423702  rn  :alert : Register r1 information: non-s=
lab/vmalloc memory
    2022-02-07T06:41:02.429423  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:41:02.434007  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-07T06:41:02.442720  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4d5a800 pointer offset 64 size 1024
    2022-02-07T06:41:02.448481  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-07T06:41:02.457404  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4d5a800 pointer offset 608 size 1024
    2022-02-07T06:41:02.465811  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4d5a800 pointer offset 64 size 1024
    2022-02-07T06:41:02.474377  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024
    2022-02-07T06:41:02.479475  kern  :alert : Register r9 information: non=
-paged memory =

    ... (43 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6200bb71ef1a378cc65d6f08

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200bb72ef1a378=
cc65d6f0f
        failing since 3 days (last pass: next-20220128, first fail: next-20=
220204)
        16 lines

    2022-02-07T06:25:40.724473  kern  :alert : 8<--- cut here ---
    2022-02-07T06:25:40.732560  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200bb72ef1a378=
cc65d6f10
        failing since 3 days (last pass: next-20220128, first fail: next-20=
220204)
        54 lines

    2022-02-07T06:25:40.744671  kern  :alert : [000001a0] *pgd=3Dbc<8>[   3=
7.226176] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-07T06:25:40.745099  bf2835
    2022-02-07T06:25:40.749362  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T06:25:40.755006  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:25:40.760816  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:25:40.765615  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T06:25:40.774385  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c46a4400 pointer offset 64 size 1024
    2022-02-07T06:25:40.782339  kern  :alert : Register r5 information: sla=
b task_struct start c2309100 pointer offset 0
    2022-02-07T06:25:40.790956  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024
    2022-02-07T06:25:40.799558  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c46a4400 pointer offset 128 size 1024 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6200bd3bb51f87b1b95d6f0b

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200bd3bb51f87b=
1b95d6f12
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-07T06:33:09.214906  kern  :alert : 8<--- cut here ---
    2022-02-07T06:33:09.222840  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-07T06:33:09.234385  kern  :alert : [000001a0] *pgd=3Dbc<8>[   3=
7.275594] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200bd3bb51f87b=
1b95d6f13
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        54 lines

    2022-02-07T06:33:09.235626  975835
    2022-02-07T06:33:09.239794  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T06:33:09.245334  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:33:09.251176  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:33:09.256190  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T06:33:09.264799  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c45aa800 pointer offset 64 size 1024
    2022-02-07T06:33:09.272519  kern  :alert : Register r5 information: sla=
b task_struct start c44aee80 pointer offset 0
    2022-02-07T06:33:09.281383  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024
    2022-02-07T06:33:09.290037  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c45aa800 pointer offset 128 size 1024
    2022-02-07T06:33:09.295774  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6200bf8d1af0e127e75d6f29

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200bf8d1af0e12=
7e75d6f30
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220204)
        16 lines

    2022-02-07T06:43:16.401497  kern  :alert : 8<--- cut here ---
    2022-02-07T06:43:16.409695  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200bf8d1af0e12=
7e75d6f31
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220204)
        54 lines

    2022-02-07T06:43:16.421700  kern  :alert : [00000188] *pgd=3Dbc<8>[   3=
8.498013] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-07T06:43:16.422092  b7b835
    2022-02-07T06:43:16.426707  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T06:43:16.432187  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:43:16.437990  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:43:16.442809  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T06:43:16.451494  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c459c800 pointer offset 64 size 1024
    2022-02-07T06:43:16.459269  kern  :alert : Register r5 information: sla=
b task_struct start c2483480 pointer offset 0
    2022-02-07T06:43:16.468128  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c214b000 pointer offset 16 size 1024
    2022-02-07T06:43:16.477047  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c459c800 pointer offset 120 size 1024 =

    ... (46 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6200bd33e956deee5c5d6ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200bd33e956deee5c5d6=
eea
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
i945gsex-qs                  | i386  | lab-clabbe      | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200b8aa9d9484e9d25d6f04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-clabbe/baseline-i945gsex-qs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-clabbe/baseline-i945gsex-qs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200b8aa9d9484e9d25d6=
f05
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6200be87acf5a308b55d6f3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200be87acf5a308b55d6=
f3e
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386                    | i386  | lab-baylibre    | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200b9ac9ed9f659065d6eff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200b9ac9ed9f659065d6=
f00
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386                    | i386  | lab-broonie     | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200b9c9f8576628795d6f11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200b9c9f8576628795d6=
f12
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386                    | i386  | lab-cip         | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200bc7912c36a173a5d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200bc7912c36a173a5d6=
ee9
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386                    | i386  | lab-linaro-lkft | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200c2fce3787564585d6eea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200c2fce3787564585d6=
eeb
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386-uefi               | i386  | lab-baylibre    | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200b9d49ed9f659065d6f55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200b9d49ed9f659065d6=
f56
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386-uefi               | i386  | lab-broonie     | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200b9ca1a564e625d5d6fd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200b9ca1a564e625d5d6=
fd2
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386-uefi               | i386  | lab-cip         | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200bcabd1c024f1e15d6ef2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200bcabd1c024f1e15d6=
ef3
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_i386-uefi               | i386  | lab-linaro-lkft | clang-14 | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6200c2fdbda019580b5d6f17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6200c2fdbda019580b5d6=
f18
        new failure (last pass: next-20220204) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6200c8d0c100fa37495d6f23

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6200c8d0c100fa37495d6f44
        failing since 14 days (last pass: next-20220121, first fail: next-2=
0220124)

    2022-02-07T07:22:38.956801  <4>[   22.892652] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-02-07T07:22:39.532664  /lava-5631613/1/../bin/lava-test-case
    2022-02-07T07:22:39.543080  <8>[   23.480823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-14 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6200beec01ce29e78d5d6ee8

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200beec01ce29e=
78d5d6eef
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-07T06:40:26.157081  kern  :alert : 8<--- cut here ---
    2022-02-07T06:40:26.167904  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-07T06:40:26.177167  kern  :alert : [000001a0] *pgd=3D7d[   42.9=
82620] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-07T06:40:26.177545  5bb835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200beec01ce29e=
78d5d6ef0
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        83 lines

    2022-02-07T06:40:26.182620  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T06:40:26.188109  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:40:26.191667  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:40:26.197187  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-07T06:40:26.208115  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4cf8400 pointer offset 64 size 1024
    2022-02-07T06:40:26.211719  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-07T06:40:26.222719  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4cf8400 pointer offset 608 size 1024
    2022-02-07T06:40:26.228220  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4cf8400 pointer offset 64 size 1024
    2022-02-07T06:40:26.237400  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-07T06:40:26.242854  kern  :alert : Register r9 information: non=
-paged memory =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6200bdfd45eb25fc0f5d6eeb

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200bdfd45eb25f=
c0f5d6ef2
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220204)
        16 lines

    2022-02-07T06:36:25.101885  kern  :alert : 8<--- cut here ---
    2022-02-07T06:36:25.112788  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-07T06:36:25.122063  kern  :alert : [000001a0] *pgd=3D7d[   43.2=
77784] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-07T06:36:25.122450  3d2835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200bdfd45eb25f=
c0f5d6ef3
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220204)
        54 lines

    2022-02-07T06:36:25.127544  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T06:36:25.132979  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:36:25.136655  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:36:25.142112  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T06:36:25.152909  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c456bc00 pointer offset 64 size 1024
    2022-02-07T06:36:25.156698  kern  :alert : Register r5 information: sla=
b task_struct start c45f4400 pointer offset 0
    2022-02-07T06:36:25.167775  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-07T06:36:25.176858  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c456bc00 pointer offset 128 size 1024
    2022-02-07T06:36:25.182393  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-07T06:36:25.193325  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6200be741c6b10f43e5d6ee8

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200be741c6b10f=
43e5d6eef
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-07T06:38:23.934331  kern  :alert : 8<--- cut here ---
    2022-02-07T06:38:23.945154  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-07T06:38:23.954403  kern  :alert : [000001a0] *pgd=3D7d[   43.1=
55522] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-07T06:38:23.954809  14b835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200be741c6b10f=
43e5d6ef0
        failing since 5 days (last pass: next-20220127, first fail: next-20=
220201)
        54 lines

    2022-02-07T06:38:23.959883  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T06:38:23.965348  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:38:23.969026  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:38:23.974502  kern  :alert : Register r3 information: non=
-slab/vmalloc memory
    2022-02-07T06:38:23.985410  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c21b0c00 pointer offset 64 size 1024
    2022-02-07T06:38:23.994658  kern  :alert : Register r5 information: sla=
b task_struct start c227dd80 pointer offset 0
    2022-02-07T06:38:24.000088  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-07T06:38:24.009329  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c21b0c00 pointer offset 128 size 1024
    2022-02-07T06:38:24.015536  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-07T06:38:24.025651  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6200bf7908f3e945f45d6f0b

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200bf7908f3e94=
5f45d6f12
        failing since 3 days (last pass: next-20220125, first fail: next-20=
220204)
        16 lines

    2022-02-07T06:42:26.702243  kern  :alert : 8<--- cut here ---
    2022-02-07T06:42:26.713111  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-07T06:42:26.722433  kern  :alert : [00000188] *pgd=3D7d[   45.5=
93180] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-07T06:42:26.722715  378835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200bf7908f3e94=
5f45d6f13
        failing since 3 days (last pass: next-20220125, first fail: next-20=
220204)
        54 lines

    2022-02-07T06:42:26.727891  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T06:42:26.733337  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:42:26.736994  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:42:26.742494  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T06:42:26.753423  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4486800 pointer offset 64 size 1024
    2022-02-07T06:42:26.762674  kern  :alert : Register r5 information: sla=
b task_struct start c4441680 pointer offset 0
    2022-02-07T06:42:26.768216  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 16 size 1024
    2022-02-07T06:42:26.777337  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4486800 pointer offset 120 size 1024
    2022-02-07T06:42:26.788516  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-07T06:42:26.793748  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6200ba5ff2f4e144bb5d6f16

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200ba5ff2f4e14=
4bb5d6f1d
        failing since 2 days (last pass: next-20211222, first fail: next-20=
220204)
        16 lines

    2022-02-07T06:21:03.281661  kern  :alert : 8<--- cut here ---
    2022-02-07T06:21:03.283721  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-07T06:21:03.284857  kern  :alert : [000001a0] *pgd=3D7d3e5835
    2022-02-07T06:21:03.286070  kern  :alert : Register<8>[   37.126517] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-07T06:21:03.287219   r0 information: NULL pointer
    2022-02-07T06:21:03.288321  kern  :alert : Register r1 information:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200ba5ff2f4e14=
4bb5d6f1e
        failing since 2 days (last pass: next-20211222, first fail: next-20=
220204)
        54 lines

    2022-02-07T06:21:03.293490  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:21:03.294670  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T06:21:03.325146  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c45a7800 pointer offset 64 size 1024
    2022-02-07T06:21:03.326531  kern  :alert : Register r5 information: sla=
b task_struct start c227b300 pointer offset 0
    2022-02-07T06:21:03.328269  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a5c00 pointer offset 16 size 1024
    2022-02-07T06:21:03.329371  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c45a7800 pointer offset 128 size 1024
    2022-02-07T06:21:03.330574  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-07T06:21:03.367783  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a5c00 pointer offset 0 size 1024
    2022-02-07T06:21:03.370164  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c455cc00 pointer offset 0 size 1024
    2022-02-07T06:21:03.371441  kern  :alert : Register r11 information: NU=
LL pointer =

    ... (42 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6200bdba1387e7bbc65d6f43

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200bdba1387e7b=
bc65d6f4a
        new failure (last pass: next-20211222)
        16 lines

    2022-02-07T06:35:17.597350  kern  :alert : 8<--- cut here ---
    2022-02-07T06:35:17.599676  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-07T06:35:17.601009  kern  :alert : [000001a0] *pgd=3D7d<8>[   3=
7.063534] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-07T06:35:17.602402  128835
    2022-02-07T06:35:17.603636  kern  :alert : Register r0 information: NUL=
L pointer   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200bdba1387e7b=
bc65d6f4b
        new failure (last pass: next-20211222)
        54 lines

    2022-02-07T06:35:17.609518  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T06:35:17.610873  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T06:35:17.612127  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T06:35:17.645577  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c44eb800 pointer offset 64 size 1024
    2022-02-07T06:35:17.646944  kern  :alert : Register r5 information: sla=
b task_struct start c227c400 pointer offset 0
    2022-02-07T06:35:17.648208  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a5c00 pointer offset 16 size 1024
    2022-02-07T06:35:17.649491  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c44eb800 pointer offset 128 size 1024
    2022-02-07T06:35:17.650844  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-07T06:35:17.683291  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a5c00 pointer offset 0 size 1024
    2022-02-07T06:35:17.685513  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c4600c00 pointer offset 0 size 1024 =

    ... (42 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6200c4884673f1868d5d6eed

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200c4884673f18=
68d5d6ef4
        failing since 2 days (last pass: next-20211214, first fail: next-20=
220204)
        16 lines

    2022-02-07T07:04:19.683448  kern  :alert : 8<--- cut here ---
    2022-02-07T07:04:19.685495  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-07T07:04:19.687033  kern  :alert : [00000188] *pgd=3D7d<8>[   3=
8.538131] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-07T07:04:19.688274  353835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6200c4884673f18=
68d5d6ef5
        failing since 2 days (last pass: next-20211214, first fail: next-20=
220204)
        54 lines

    2022-02-07T07:04:19.694207  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-07T07:04:19.695421  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-07T07:04:19.696641  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-07T07:04:19.697856  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-07T07:04:19.727158  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c446d400 pointer offset 64 size 1024
    2022-02-07T07:04:19.729221  kern  :alert : Register r5 information: sla=
b task_struct start c24bd680 pointer offset 0
    2022-02-07T07:04:19.730624  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f6c00 pointer offset 16 size 1024
    2022-02-07T07:04:19.732506  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c446d400 pointer offset 120 size 1024
    2022-02-07T07:04:19.733716  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-07T07:04:19.769140  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f6c00 pointer offset 0 size 1024 =

    ... (44 line(s) more)  =

 =20
