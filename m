Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF9F6C9B82
	for <lists+linux-next@lfdr.de>; Mon, 27 Mar 2023 08:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjC0Grh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Mar 2023 02:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjC0Grg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Mar 2023 02:47:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703D5468A
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2023 23:47:13 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id ix20so7461802plb.3
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2023 23:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679899633;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eVkpt6Uz9xKtIpgBZX/lzCthEichKiVb0UaBj92gl/E=;
        b=AWa9/GBtOua08FwMyumvwM5Opjq7KtGrR3QD2ziKjHm1GH1s5OprVm8iTbT6bK42j2
         VFpRDQYgvFJx/rMg+O91e5RZrCFCJHCWIWURDMaTlHzBBpH/0RwffGNWa+HYkt3Jtorv
         uB5svPcbYx3t9Ceoatvf4MzdKMFOL0SeVZHaRr/Lf74q3iT32NmM/qJKznWKLOORzGHC
         hJDcofQ7JIAnDjP21/fHiCHw3/uuOiGC/0HNMdBMbNK/pajlrqyIM2pLKmVIOHyUrA54
         Crm5l4gqeF5w1bkvvvCXUCJAGJkHHpLY3ID2IDrldPrPqdA5RKzerHOiHIetRTRhVuDR
         ZfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679899633;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVkpt6Uz9xKtIpgBZX/lzCthEichKiVb0UaBj92gl/E=;
        b=YiLDhzi0nv69Q5v/7vUbH3/CWu2i3RNBPKvTDIZA9R+r47UrfzFjuz6aVkKO9K7Amg
         MNs6ceqKJ734bFKRAI+SJXjDo/ZSewAa0uv9wG5vk/fr4iKsH5PbfppXMn0wIGP/O/AB
         JfXjleYdUR5PEWGOeCzeLmnjX3OOtvuvzCAsM0mUA0MZYSY5nIt9Wy4H74kSkeqznRH0
         yGKWP6eoN8lqe5I7/BmbECcrpxwzW5Tn/XDSS5OGdhh50f8ufyxF5AEyPEZgjbamWVPu
         3JxOwwaatVxqYBwEED25Qid+HzcBUQQe1n01i7s1bZ2A/t9lp7oo32PA1hgqhhZ3xtmV
         KRTQ==
X-Gm-Message-State: AAQBX9feLXiSNdttohnYAyT7oA0LPYr4NCj8/1PQ+OcT2LYCzpmxQoqY
        j0rQfsGQwCCfLFkrJEPWc0oEKf4yNW2YF6Yat7Y=
X-Google-Smtp-Source: AKy350Z+VQZYKijRiph1Oo7L5TjrylqN5qqXbSk1R5dJRB9MTvOnrSwQWogBMgmlPJXyZgRgLwPNzg==
X-Received: by 2002:a17:90b:1b48:b0:23f:7770:9e75 with SMTP id nv8-20020a17090b1b4800b0023f77709e75mr12068114pjb.47.1679899632325;
        Sun, 26 Mar 2023 23:47:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w23-20020a170902d71700b0019a7d6a9a76sm18368229ply.111.2023.03.26.23.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 23:47:11 -0700 (PDT)
Message-ID: <64213bef.170a0220.bc251.1a8c@mx.google.com>
Date:   Sun, 26 Mar 2023 23:47:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230327
Subject: next/master baseline: 502 runs, 20 regressions (next-20230327)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 502 runs, 20 regressions (next-20230327)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230327/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230327
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      011eb7443621f49ca1e8cdf9c74c215f25019118 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642107c1d0d5f4d3fb9c951a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/642107c1d0d5f4d3fb9c9529
        failing since 5 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-27T03:04:11.811541  /lava-9781435/1/../bin/lava-test-case

    2023-03-27T03:04:11.830464  <8>[   13.790409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6420fbfa58175cdd629c953c

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/6420fbfa58175cdd629c954b
        failing since 5 days (last pass: next-20230320, first fail: next-20=
230321)

    2023-03-27T02:13:58.850843  /lava-9780790/1/../bin/lava-test-case

    2023-03-27T02:13:58.857472  <8>[   12.154101] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64210be12f553b74659c955a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64210be12f553b74659c9=
55b
        failing since 190 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6421038872b0aca9919c9514

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6421038872b0aca9919c9=
515
        failing since 54 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420fe39be3c18e0bb9c957e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420fe39be3c18e0bb9c9=
57f
        failing since 17 days (last pass: next-20230308, first fail: next-2=
0230309) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420fd533af4a6ce319c954b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420fd533af4a6ce319c9554
        failing since 67 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-03-27T02:19:45.189139  <8>[   14.014830] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3447636_1.5.2.4.1>
    2023-03-27T02:19:45.300256  / # #
    2023-03-27T02:19:45.403416  export SHELL=3D/bin/sh
    2023-03-27T02:19:45.403851  #
    2023-03-27T02:19:45.505183  / # export SHELL=3D/bin/sh. /lava-3447636/e=
nvironment
    2023-03-27T02:19:45.506121  =

    2023-03-27T02:19:45.608146  / # . /lava-3447636/environment/lava-344763=
6/bin/lava-test-runner /lava-3447636/1
    2023-03-27T02:19:45.609783  =

    2023-03-27T02:19:45.614417  / # /lava-3447636/bin/lava-test-runner /lav=
a-3447636/1
    2023-03-27T02:19:45.703617  <3>[   14.530076] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6421042441c501030f9c957d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6421042441c5010=
30f9c9580
        failing since 41 days (last pass: next-20230208, first fail: next-2=
0230213)
        29 lines

    2023-03-27T02:48:51.289863  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-27T02:48:51.290458  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-27T02:48:51.290921  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2c2000 allocated at load_module+0x690/0=
x1a80
    2023-03-27T02:48:51.293028  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-27T02:48:51.397022  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-27T02:48:51.397731  kern  :emerg : Process udevd (pid: 64, stac=
k limit =3D 0xa7b89377)
    2023-03-27T02:48:51.398243  kern  :emerg : Stack: (0xc88fdd08 to 0xc88f=
e000)
    2023-03-27T02:48:51.399121  kern  :emerg : dd00:                   c4ef=
3200 c076f860 00000000 c03add20 00000000 31a08ecf
    2023-03-27T02:48:51.399645  kern  :emerg : dd20: 0000005d 31a08ecf c076=
f860 bf2c2220 00000000 00000000 00000000 00000001
    2023-03-27T02:48:51.400092  kern  :emerg : dd40: c076f85c bf3004a0 bf2c=
2220 00000000 00000000 00000000 00000000 bf2c63c8 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6421081aba26442c439c9559

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/6421081aba26442c439c9568
        failing since 5 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-27T03:05:37.938650  /lava-9781458/1/../bin/lava-test-case

    2023-03-27T03:05:37.956551  <8>[   12.949181] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6420fbf258175cdd629c9519

  Results:     17 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/6420fbf258175cdd629c9528
        failing since 5 days (last pass: next-20230320, first fail: next-20=
230321)

    2023-03-27T02:13:49.809964  /lava-9780767/1/../bin/lava-test-case

    2023-03-27T02:13:49.816397  <8>[   12.241259] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642107b6b89216775f9c955e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/642107b6b89216775f9c956d
        failing since 5 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-27T03:04:05.553880  /lava-9781421/1/../bin/lava-test-case

    2023-03-27T03:04:05.570397  <8>[   13.209620] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6420fbd1d5ea8a76059c953c

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/6420fbd1d5ea8a76059c954b
        failing since 5 days (last pass: next-20230320, first fail: next-20=
230321)

    2023-03-27T02:13:21.434588  /lava-9780759/1/../bin/lava-test-case

    2023-03-27T02:13:21.441018  <8>[    9.336468] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420ff5b41a490ff8b9c9524

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420ff5b41a490ff8b9c9=
525
        failing since 349 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64210a715c5ecc1f549c9531

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64210a715c5ecc1f549c9=
532
        failing since 61 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642109942c8aecaa939c950f

  Results:     177 PASS, 8 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-apmixedsys-probed: https://kernelci.org/test=
/case/id/642109942c8aecaa939c95b2
        failing since 5 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-27T03:11:49.246630  /lava-9781543/1/../bin/lava-test-case

    2023-03-27T03:11:49.253041  <8>[    5.771403] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-apmixedsys-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642103d816ca43f2079c9505

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642103d816ca43f2079c9=
506
        failing since 215 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64210040e1c72dcd2f9c9587

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64210040e1c72dcd2f9c9=
588
        failing since 11 days (last pass: next-20230310, first fail: next-2=
0230315) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642101d3c558e38c2f9c9505

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642101d3c558e38c2f9c9=
506
        failing since 124 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420ff52ff2f7776c49c953b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420ff52ff2f7776c49c9=
53c
        failing since 124 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6421044c41c501030f9c95a4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6421044c41c501030f9c95ad
        failing since 29 days (last pass: next-20230224, first fail: next-2=
0230225)

    2023-03-27T02:49:35.709809  <8>[    9.564649] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3447759_1.5.2.4.1>
    2023-03-27T02:49:35.829175  / # #
    2023-03-27T02:49:35.934684  export SHELL=3D/bin/sh
    2023-03-27T02:49:35.936202  #
    2023-03-27T02:49:36.039573  / # export SHELL=3D/bin/sh. /lava-3447759/e=
nvironment
    2023-03-27T02:49:36.041155  =

    2023-03-27T02:49:36.144481  / # . /lava-3447759/environment/lava-344775=
9/bin/lava-test-runner /lava-3447759/1
    2023-03-27T02:49:36.147215  =

    2023-03-27T02:49:36.154622  / # /lava-3447759/bin/lava-test-runner /lav=
a-3447759/1
    2023-03-27T02:49:36.283018  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64210342d40098d3dc9c9535

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230327/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230327/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64210342d40098d3dc9c953e
        failing since 61 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-03-27T02:45:01.687430  / # #
    2023-03-27T02:45:01.789326  export SHELL=3D/bin/sh
    2023-03-27T02:45:01.789733  #
    2023-03-27T02:45:01.891180  / # export SHELL=3D/bin/sh. /lava-3447762/e=
nvironment
    2023-03-27T02:45:01.891728  =

    2023-03-27T02:45:01.993141  / # . /lava-3447762/environment/lava-344776=
2/bin/lava-test-runner /lava-3447762/1
    2023-03-27T02:45:01.993774  =

    2023-03-27T02:45:01.999380  / # /lava-3447762/bin/lava-test-runner /lav=
a-3447762/1
    2023-03-27T02:45:02.152270  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-27T02:45:02.152594  + cd /lava-3447762/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
