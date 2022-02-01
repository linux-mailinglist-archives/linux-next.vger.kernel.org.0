Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557114A66CC
	for <lists+linux-next@lfdr.de>; Tue,  1 Feb 2022 22:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241044AbiBAVGe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Feb 2022 16:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234125AbiBAVGe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Feb 2022 16:06:34 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC15C061714
        for <linux-next@vger.kernel.org>; Tue,  1 Feb 2022 13:06:33 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id r137so789929pgr.7
        for <linux-next@vger.kernel.org>; Tue, 01 Feb 2022 13:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WUORAr70LL28xt+ZfuBE5io3wgvnWLo3TkfVyba0I8g=;
        b=28x+4IzlzCgTfI5qD96tk8kFqiFG8ZV8R4Twsfv65swA4fjmWmNc2iUi+4dQVrkZ/T
         1i7TVKaPV3dC56YuJHYI2uwm9qDZvJktA03FFJBJgtrhh8AlMTt7UM3pNyr+SMr0WN9S
         OayIMUAOznfqjg+BhO0wOmC4LxeDsCJlh4hTyMypUiAzNHt5aPaLJVg858GQ506PsyvM
         60JAn98rLPbKG7NZwTGGiOnR5h4FYocbFqEP0rl+Vntz2sOhLfvxYCJmLa1BGba10CCb
         hF6iqz1D7/J178gNDVJxUrjK38OnbxNxccs8BeoSIsSbQ4/OVCt1RjPbgJ5DIiqUmsJC
         jppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WUORAr70LL28xt+ZfuBE5io3wgvnWLo3TkfVyba0I8g=;
        b=dfRgmBI40Lh3rPv+R14iOgF8ZL8oklvqYJamoHlQI7eS5fRgUHYfMuA7m2jUOg6E4E
         MEX7YHnv8imM5NPqbdfWGGCnt6sczYahID9Fh3NWIJ4c5S3kQciXOQh6c+mTOO5+LQHk
         WJb3J/JWGfAaS7kTs+hPGD3jR/DhmcKOeiaBc5iEy8hJmkWs9wL0D17LGEs3YPhVHhV+
         zHKvRlKpKR7Gl1awOu+TdHoMg1tp+tH55KZyj6m3ixeJO30WLTyZuAYk+YqtjCmXiY9b
         YYfFH/yFpDVf///RtePr/0CuRnya1r4gdMaJM7E5ACIxURMcuoAlx3lUw2iReldgjTru
         Uw6w==
X-Gm-Message-State: AOAM531LxDcJ6i7nVgxz6B0ZYkxNwU4aH+2zuJVrpGjVp8ExiOl5bH9N
        Xmp5MXADzXGPGnGzHlgcujgkE+/Sbpf+64Mb
X-Google-Smtp-Source: ABdhPJzMnsiFAWAQ4MhaK9RKDE8KIFKAZ99lWZjr3/DMd9ejVFxph39BXrwmo0ceTCmsQav+uslFKA==
X-Received: by 2002:a63:81c2:: with SMTP id t185mr22187081pgd.107.1643749592707;
        Tue, 01 Feb 2022 13:06:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l14sm4091186pjf.1.2022.02.01.13.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 13:06:32 -0800 (PST)
Message-ID: <61f9a0d8.1c69fb81.5107b.8d25@mx.google.com>
Date:   Tue, 01 Feb 2022 13:06:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220201
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 708 runs, 22 regressions (next-20220201)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 708 runs, 22 regressions (next-20220201)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                  | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 1          =

cubietruck                 | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 2          =

cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =

imx8mn-ddr4-evk            | arm64 | lab-nxp         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | clang-14 | multi_v7_=
defconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220201/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220201
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      711428e8f370eff043ae549572b8141987861583 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f968815d245d8fc35d6eeb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f968815d245d8fc35d6=
eec
        failing since 8 days (last pass: next-20220121, first fail: next-20=
220124) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beagle-xm                  | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61f9686646cfa2ab965d6ef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f9686646cfa2ab965d6=
ef5
        failing since 16 days (last pass: next-20220115, first fail: next-2=
0220116) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/61f96af99327960f455d6ee8

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f96af99327960=
f455d6eef
        new failure (last pass: next-20220127)
        16 lines

    2022-02-01T17:16:25.693414  <8>[   37.177218] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-01T17:16:25.725215  kern  :alert : 8<--- cut here ---
    2022-02-01T17:16:25.733437  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-01T17:16:25.737028  kern  :alert : [000001a0] *pgd=3Dbcd63835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f96af99327960=
f455d6ef0
        new failure (last pass: next-20220127)
        83 lines

    2022-02-01T17:16:25.748222  kern  :alert : Register<8>[   37.229449] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-01T17:16:25.750478   r0 information: NULL pointer
    2022-02-01T17:16:25.755955  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-01T17:16:25.761598  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-01T17:16:25.766347  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-01T17:16:25.775160  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4d58800 pointer offset 64 size 1024
    2022-02-01T17:16:25.780684  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-01T17:16:25.789394  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4d58800 pointer offset 608 size 1024
    2022-02-01T17:16:25.797980  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4d58800 pointer offset 64 size 1024
    2022-02-01T17:16:25.806810  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21aa400 pointer offset 16 size 1024 =

    ... (44 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f96817fb266f07675d6eff

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f96817fb266f0=
7675d6f06
        new failure (last pass: next-20220127)
        16 lines

    2022-02-01T17:04:10.687942  kern  :alert : 8<--- cut here ---
    2022-02-01T17:04:10.699563  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-01T17:04:10.707521  kern  :alert : [000001a0] *pgd=3Dbc96c835
    2022-02-01T17:04:10.711713  kern  :alert : Register<8>[   37.316140] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f96817fb266f0=
7675d6f07
        new failure (last pass: next-20220127)
        55 lines

    2022-02-01T17:04:10.720290   r0 information: NULL pointer
    2022-02-01T17:04:10.720578  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-01T17:04:10.727572  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-01T17:04:10.736079  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-01T17:04:10.739585  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c457c800 pointer offset 64 size 1024
    2022-02-01T17:04:10.743554  kern  :alert : Register r5 information: sla=
b task_struct start c44bbb80 pointer offset 0
    2022-02-01T17:04:10.757995  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21aa400 pointer offset 16 size 1024
    2022-02-01T17:04:10.763570  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c457c800 pointer offset 128 size 1024
    2022-02-01T17:04:10.771526  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-01T17:04:10.778050  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21aa400 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk            | arm64 | lab-nxp         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f965bf8bc999650c5d6f33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f965bf8bc999650c5d6=
f34
        new failure (last pass: next-20220131) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f968ca98349b7fa45d6f0c

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/61f968ca98349b7f=
a45d6f12
        failing since 0 day (last pass: next-20220127, first fail: next-202=
20131)
        1 lines

    2022-02-01T17:06:56.413840  / # =

    2022-02-01T17:06:56.534577  #
    2022-02-01T17:06:56.641228  export SHELL=3D/bin/sh
    2022-02-01T17:06:56.643450  =

    2022-02-01T17:06:56.644693  / # #
    2022-02-01T17:06:56.748530  / # export SHELL=3D/bin/sh. /lava-1480449/e=
nvironment
    2022-02-01T17:06:56.852574  /lava-1480449/bin/lava-test-runner /lava-14=
80449/0
    2022-02-01T17:06:56.858684  =

    2022-02-01T17:06:56.859916  / # . /lava-1480449/environment
    2022-02-01T17:06:56.861958  / # /lava-1480449/bin/lava-test-runner /lav=
a-1480449/0 =

    ... (8 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f968ca98349b7=
fa45d6f14
        failing since 0 day (last pass: next-20220127, first fail: next-202=
20131)
        2 lines

    2022-02-01T17:06:57.006187  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2022-02-01T17:06:57.008315  kern  :emerg : Code: d2800028 d2e02809 f2e0=
0808 17ffffd1 (d4210000<8>[   16.547792] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-02-01T17:06:57.009583  ) =

    2022-02-01T17:06:57.010860  + set +x   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f9700ebb9a472b0e5d6ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f9700ebb9a472b0e5d6=
ef4
        failing since 49 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f9771225ced483b65d6f13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f9771225ced483b65d6=
f14
        failing since 49 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f96fa5c358ba44395d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f96fa5c358ba44395d6=
ee9
        failing since 49 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f96f84eb8a8cc52c5d6f08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f96f84eb8a8cc52c5d6=
f09
        failing since 49 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f97021c3fce7fe7f5d6f05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f97021c3fce7fe7f5d6=
f06
        failing since 48 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f9778e8e0a84c7df5d6f01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f9778e8e0a84c7df5d6=
f02
        failing since 48 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f96fa21f819255585d6f08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f96fa21f819255585d6=
f09
        failing since 48 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f96f85eb8a8cc52c5d6f0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f96f85eb8a8cc52c5d6=
f0e
        failing since 48 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61f9691caaac8e90b85d6efa

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61f9691daaac8e90b85d6f1c
        failing since 8 days (last pass: next-20220121, first fail: next-20=
220124)

    2022-02-01T17:08:22.240064  <8>[   22.294991] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-02-01T17:08:22.858465  <4>[   22.912592] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-02-01T17:08:23.262807  /lava-5587301/1/../bin/lava-test-case
    2022-02-01T17:08:23.273931  <8>[   23.328834] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | clang-14 | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/61f96a0ea1fa9e76e25d6f08

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220131071833+f3876=
7d77156-1~exp1~20220131071935.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f96a0ea1fa9e7=
6e25d6f0f
        new failure (last pass: next-20220127)
        16 lines

    2022-02-01T17:12:26.005788  kern  :alert : 8<--- cut here ---
    2022-02-01T17:12:26.011302  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-01T17:12:26.016713  kern  :alert : [000001a0] *pgd=3D7d374835
    2022-02-01T17:12:26.022185  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-01T17:12:26.027961  ke[   43.423031] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f96a0ea1fa9e7=
6e25d6f10
        new failure (last pass: next-20220127)
        83 lines

    2022-02-01T17:12:26.033427  rn  :alert : Register r1 information: non-s=
lab/vmalloc memory
    2022-02-01T17:12:26.038878  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-01T17:12:26.042552  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-01T17:12:26.053444  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4e7d800 pointer offset 64 size 1024
    2022-02-01T17:12:26.058902  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-01T17:12:26.068145  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4e7d800 pointer offset 608 size 1024
    2022-02-01T17:12:26.073693  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4e7d800 pointer offset 64 size 1024
    2022-02-01T17:12:26.082829  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21a2000 pointer offset 16 size 1024
    2022-02-01T17:12:26.088350  kern  :alert : Register r9 information: non=
-paged memory
    2022-02-01T17:12:26.099275  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c4e7d800 pointer offset 128 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f9681b67f6fe03065d6ee9

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220201/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f9681b67f6fe0=
3065d6ef0
        new failure (last pass: next-20220127)
        16 lines

    2022-02-01T17:04:05.924180  kern  :alert : 8<--- cut here ---
    2022-02-01T17:04:05.935115  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-01T17:04:05.944488  kern  :alert : [000001a0] *pgd=3D7d[   44.1=
72358] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-01T17:04:05.944879  15d835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f9681b67f6fe0=
3065d6ef1
        new failure (last pass: next-20220127)
        55 lines

    2022-02-01T17:04:05.949765  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-01T17:04:05.955237  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-01T17:04:05.958964  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-01T17:04:05.964659  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-01T17:04:05.975487  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c45a5800 pointer offset 64 size 1024
    2022-02-01T17:04:05.979162  kern  :alert : Register r5 information: sla=
b task_struct start c40b2200 pointer offset 0
    2022-02-01T17:04:05.990726  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a2000 pointer offset 16 size 1024
    2022-02-01T17:04:05.999359  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c45a5800 pointer offset 128 size 1024
    2022-02-01T17:04:06.004000  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-01T17:04:06.013691  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a2000 pointer offset 0 size 1024 =

    ... (42 line(s) more)  =

 =20
