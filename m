Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B126CFFEF
	for <lists+linux-next@lfdr.de>; Thu, 30 Mar 2023 11:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjC3JkO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Mar 2023 05:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjC3JkN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Mar 2023 05:40:13 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87196A63
        for <linux-next@vger.kernel.org>; Thu, 30 Mar 2023 02:40:07 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id n14so1681041plc.8
        for <linux-next@vger.kernel.org>; Thu, 30 Mar 2023 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680169207;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe7K0tKXS74hviTe3Y/qS6cXCA79XJZqOjkVVdAKNwE=;
        b=6SkpmrcPDCSr4B/TB+FCUsHDJSlcqT8H3NRDV9ar+cdUPvdb+NGlxYyYh9SeJDdS1S
         HaoiITBofL7yQkW05Ov8aqvbd4O1VmYQVL8jeG7RkSafZ+9snqG1zcDRdaw3KgW6XhV3
         OyX+03EMHbceoPFORB56T+huSmrexofkS4YuBN3S7YLCn6Apw5BAmOAwxQ/DyEPgUgFJ
         MD1BcmWcsHOVwJwwB6FuHTotTkMBmUKkOkMxtEEa1ntadLpVHUPrNvn+zyEdMNmIE3Y1
         FWAXyROi8Db6lpR4ZAbraDbqU3DT7AGYJKobPSU6aRv4GYfRJEM3Tin/7NuqZf5Stf2z
         e5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680169207;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qe7K0tKXS74hviTe3Y/qS6cXCA79XJZqOjkVVdAKNwE=;
        b=JQYE3WMzdlS2ZxZEo7LENPzDPixrP1YI4QF5nr6ezcpZhd8/3UKp6X1j8P11N7IGXg
         UoC0XhZs605JAocXxtsYkMzRDZRgx2bXjhYihnS6rMRvbgCVuQRJipZVexNpQaYG+JCw
         I7QMfPgSqi8nKKo51pzKBKtJo7SsRF2l+hfqvb4QLa5+3fabLRGvNbpMK4vgl+qlG6HV
         qVXEfVkqHdMImUTwSG1nhZEAjkKjC6QSAz7MlAHefx6HyUelW80LVE2MxrqfwtbOKyPj
         kR5joTfzUmCOtfGhFPIbw8EAQ3IZaGW89h+W5XRcfW+m/WJVFwTD+cJcoizQ3OTQVeK3
         dv6g==
X-Gm-Message-State: AO0yUKUbsxjGTwRl4GnwqY+VQKtJCN+R3ogiMZhB5kz0Fi4JwQfYkGTu
        M9NXKtISE/rEIYgETkwnGyiDN/7i8bBjeHTLwBfRuA==
X-Google-Smtp-Source: AK7set9BaxQH9XXRvD3Z82l6N6kto46YhNN/ujYNcusmfpUVdlS+FeMXRxXRk+B9Eqn6BWJ0kts3cg==
X-Received: by 2002:a05:6a20:6723:b0:da:501:55e with SMTP id q35-20020a056a20672300b000da0501055emr19526611pzh.40.1680169206111;
        Thu, 30 Mar 2023 02:40:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b005a84de344a6sm25456130pfd.14.2023.03.30.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 02:40:05 -0700 (PDT)
Message-ID: <642558f5.a70a0220.f7ed1.de67@mx.google.com>
Date:   Thu, 30 Mar 2023 02:40:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc4-271-g7827aece40de
Subject: next/pending-fixes baseline: 371 runs,
 31 regressions (v6.3-rc4-271-g7827aece40de)
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

next/pending-fixes baseline: 371 runs, 31 regressions (v6.3-rc4-271-g7827ae=
ce40de)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc4-271-g7827aece40de/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc4-271-g7827aece40de
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7827aece40de38935eccec13028429f78aa6b170 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251e3c712cc45c8162f771

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4251e3c712cc45c8162f780
        new failure (last pass: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:29:09.347277  /lava-9811673/1/../bin/lava-test-case<8>[  =
 11.483994] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall-cpus-are-online RESULT=
=3Dpass>

    2023-03-30T05:29:09.347710  =


    2023-03-30T05:29:09.350032  /usr/bin/tpm2_getcap

    2023-03-30T05:29:09.397744  <4>[   11.540264] i2c_designware AMD0010:01=
: timeout in disabling adapter

    2023-03-30T05:29:09.424704  <4>[   11.566945] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-03-30T05:29:09.451560  <4>[   11.593944] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-03-30T05:29:09.458235  <4>[   11.600576] tpm tpm0: i2c transfer fa=
iled (attempt 2/3): -110

    2023-03-30T05:29:09.484674  <4>[   11.626752] i2c_designware AMD0010:01=
: timeout waiting for bus ready

    2023-03-30T05:29:09.491297  <4>[   11.633375] tpm tpm0: i2c transfer fa=
iled (attempt 3/3): -110

    2023-03-30T05:29:09.517555  <4>[   11.659943] i2c_designware AMD0010:01=
: timeout waiting for bus ready
 =

    ... (124 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64251fc7bbc22a3aa562f784

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251fc7bbc22a3aa562f=
785
        failing since 171 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251c716158747ec062f76f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251c716158747ec062f774
        failing since 1 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:21:32.137864  + set +x

    2023-03-30T05:21:32.144697  <8>[   10.852778] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811547_1.4.2.3.1>

    2023-03-30T05:21:32.252019  #

    2023-03-30T05:21:32.353291  / # #export SHELL=3D/bin/sh

    2023-03-30T05:21:32.353515  =


    2023-03-30T05:21:32.454471  / # export SHELL=3D/bin/sh. /lava-9811547/e=
nvironment

    2023-03-30T05:21:32.454698  =


    2023-03-30T05:21:32.555838  / # . /lava-9811547/environment/lava-981154=
7/bin/lava-test-runner /lava-9811547/1

    2023-03-30T05:21:32.557010  =


    2023-03-30T05:21:32.562618  / # /lava-9811547/bin/lava-test-runner /lav=
a-9811547/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251cd5d060d484d562f76d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251cd5d060d484d562f772
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:23:13.981795  <8>[    7.912946] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811683_1.4.2.3.1>

    2023-03-30T05:23:13.985040  + set +x

    2023-03-30T05:23:14.086679  / #

    2023-03-30T05:23:14.187799  # #export SHELL=3D/bin/sh

    2023-03-30T05:23:14.188036  =


    2023-03-30T05:23:14.288936  / # export SHELL=3D/bin/sh. /lava-9811683/e=
nvironment

    2023-03-30T05:23:14.289169  =


    2023-03-30T05:23:14.390149  / # . /lava-9811683/environment/lava-981168=
3/bin/lava-test-runner /lava-9811683/1

    2023-03-30T05:23:14.390464  =


    2023-03-30T05:23:14.395956  / # /lava-9811683/bin/lava-test-runner /lav=
a-9811683/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251c5e92c28c908b62f7b6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251c5e92c28c908b62f7bb
        failing since 1 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:21:23.791887  + set +x<8>[    9.271401] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9811580_1.4.2.3.1>

    2023-03-30T05:21:23.791977  =


    2023-03-30T05:21:23.896689  / # #

    2023-03-30T05:21:23.997967  export SHELL=3D/bin/sh

    2023-03-30T05:21:23.998812  #

    2023-03-30T05:21:24.100834  / # export SHELL=3D/bin/sh. /lava-9811580/e=
nvironment

    2023-03-30T05:21:24.101652  =


    2023-03-30T05:21:24.203370  / # . /lava-9811580/environment/lava-981158=
0/bin/lava-test-runner /lava-9811580/1

    2023-03-30T05:21:24.204531  =


    2023-03-30T05:21:24.208627  / # /lava-9811580/bin/lava-test-runner /lav=
a-9811580/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251cd97feb18cd6262f79f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251cd97feb18cd6262f7a4
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:23:19.534916  + <8>[   11.792660] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9811667_1.4.2.3.1>

    2023-03-30T05:23:19.535050  set +x

    2023-03-30T05:23:19.639650  / # #

    2023-03-30T05:23:19.740658  export SHELL=3D/bin/sh

    2023-03-30T05:23:19.740823  #

    2023-03-30T05:23:19.841766  / # export SHELL=3D/bin/sh. /lava-9811667/e=
nvironment

    2023-03-30T05:23:19.841927  =


    2023-03-30T05:23:19.942805  / # . /lava-9811667/environment/lava-981166=
7/bin/lava-test-runner /lava-9811667/1

    2023-03-30T05:23:19.943104  =


    2023-03-30T05:23:19.947749  / # /lava-9811667/bin/lava-test-runner /lav=
a-9811667/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251c6921e178fbab62f7af

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251c6921e178fbab62f7b4
        failing since 1 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:21:32.131422  <8>[   10.131580] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811558_1.4.2.3.1>

    2023-03-30T05:21:32.135232  + set +x

    2023-03-30T05:21:32.241666  /#

    2023-03-30T05:21:32.345142   # #export SHELL=3D/bin/sh

    2023-03-30T05:21:32.346156  =


    2023-03-30T05:21:32.448309  / # export SHELL=3D/bin/sh. /lava-9811558/e=
nvironment

    2023-03-30T05:21:32.449250  =


    2023-03-30T05:21:32.551281  / # . /lava-9811558/environment/lava-981155=
8/bin/lava-test-runner /lava-9811558/1

    2023-03-30T05:21:32.552759  =


    2023-03-30T05:21:32.558086  / # /lava-9811558/bin/lava-test-runner /lav=
a-9811558/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251cd47feb18cd6262f779

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251cd47feb18cd6262f77e
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:23:12.892418  <8>[   10.145458] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811677_1.4.2.3.1>

    2023-03-30T05:23:12.895541  + set +x

    2023-03-30T05:23:12.997078  #

    2023-03-30T05:23:13.098394  / # #export SHELL=3D/bin/sh

    2023-03-30T05:23:13.098612  =


    2023-03-30T05:23:13.199553  / # export SHELL=3D/bin/sh. /lava-9811677/e=
nvironment

    2023-03-30T05:23:13.199774  =


    2023-03-30T05:23:13.300720  / # . /lava-9811677/environment/lava-981167=
7/bin/lava-test-runner /lava-9811677/1

    2023-03-30T05:23:13.301101  =


    2023-03-30T05:23:13.306270  / # /lava-9811677/bin/lava-test-runner /lav=
a-9811677/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64251dba541e59856f62f7de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251dba541e59856f62f7e3
        failing since 77 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-30T05:27:08.187431  / # #

    2023-03-30T05:27:08.290382  export SHELL=3D/bin/sh

    2023-03-30T05:27:08.291246  #

    2023-03-30T05:27:08.393203  / # export SHELL=3D/bin/sh. /lava-9811640/e=
nvironment

    2023-03-30T05:27:08.394000  =


    2023-03-30T05:27:08.496146  / # . /lava-9811640/environment/lava-981164=
0/bin/lava-test-runner /lava-9811640/1

    2023-03-30T05:27:08.497329  =


    2023-03-30T05:27:08.507219  / # /lava-9811640/bin/lava-test-runner /lav=
a-9811640/1

    2023-03-30T05:27:08.622269  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-30T05:27:08.622847  + cd /lava-9811640/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642522e4559cd5e96862f7ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642522e4559cd5e96862f=
7ef
        failing since 31 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642522cb559cd5e96862f7a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642522cb559cd5e96862f=
7a7
        failing since 67 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64252012de97773c3962f7a1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64252012de97773c3962f7a6
        failing since 71 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-30T05:37:13.141547  <8>[   16.663441] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3454010_1.5.2.4.1>
    2023-03-30T05:37:13.251965  / # #
    2023-03-30T05:37:13.353412  export SHELL=3D/bin/sh
    2023-03-30T05:37:13.354433  #
    2023-03-30T05:37:13.456529  / # export SHELL=3D/bin/sh. /lava-3454010/e=
nvironment
    2023-03-30T05:37:13.456909  =

    2023-03-30T05:37:13.557901  / # . /lava-3454010/environment/lava-345401=
0/bin/lava-test-runner /lava-3454010/1
    2023-03-30T05:37:13.558448  =

    2023-03-30T05:37:13.563220  / # /lava-3454010/bin/lava-test-runner /lav=
a-3454010/1
    2023-03-30T05:37:13.657892  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6425212c9e84c4604962f78e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425212c9e84c4604962f793
        failing since 71 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-30T05:41:52.082472  <8>[   24.250577] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3454058_1.5.2.4.1>
    2023-03-30T05:41:52.191195  / # #
    2023-03-30T05:41:52.292988  export SHELL=3D/bin/sh
    2023-03-30T05:41:52.294097  #
    2023-03-30T05:41:52.395840  / # export SHELL=3D/bin/sh. /lava-3454058/e=
nvironment
    2023-03-30T05:41:52.396303  =

    2023-03-30T05:41:52.497646  / # . /lava-3454058/environment/lava-345405=
8/bin/lava-test-runner /lava-3454058/1
    2023-03-30T05:41:52.498310  =

    2023-03-30T05:41:52.503334  / # /lava-3454058/bin/lava-test-runner /lav=
a-3454058/1
    2023-03-30T05:41:52.600922  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642521ab19dc288fc062f792

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642521ab19dc288fc062f797
        failing since 71 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-30T05:44:02.036406  + set +x<8>[   14.742933] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3454081_1.5.2.4.1>
    2023-03-30T05:44:02.036926  =

    2023-03-30T05:44:02.147702  / # #
    2023-03-30T05:44:02.249982  export SHELL=3D/bin/sh
    2023-03-30T05:44:02.251079  #
    2023-03-30T05:44:02.353334  / # export SHELL=3D/bin/sh. /lava-3454081/e=
nvironment
    2023-03-30T05:44:02.354968  =

    2023-03-30T05:44:02.461066  / # . /lava-3454081/environment/lava-345408=
1/bin/lava-test-runner /lava-3454081/1
    2023-03-30T05:44:02.462744  =

    2023-03-30T05:44:02.463182  / # /lava-3454081/bin/lava-test-runner /lav=
a-3454081/1<3>[   15.151442] Bluetooth: hci0: command 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642522224324cd178962f76f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642522224324cd178962f774
        failing since 71 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-30T05:46:01.715538  <8>[   15.160885] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3454095_1.5.2.4.1>
    2023-03-30T05:46:01.825268  / # #
    2023-03-30T05:46:01.928562  export SHELL=3D/bin/sh
    2023-03-30T05:46:01.929595  #
    2023-03-30T05:46:02.031890  / # export SHELL=3D/bin/sh. /lava-3454095/e=
nvironment
    2023-03-30T05:46:02.032903  =

    2023-03-30T05:46:02.135168  / # . /lava-3454095/environment/lava-345409=
5/bin/lava-test-runner /lava-3454095/1
    2023-03-30T05:46:02.136869  =

    2023-03-30T05:46:02.141621  / # /lava-3454095/bin/lava-test-runner /lav=
a-3454095/1
    2023-03-30T05:46:02.227184  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251d45de975e5c3662f7f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251d45de975e5c3662f7f6
        failing since 1 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:25:10.938398  + set +x

    2023-03-30T05:25:10.945211  <8>[   10.514864] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811549_1.4.2.3.1>

    2023-03-30T05:25:11.049713  / # #

    2023-03-30T05:25:11.150729  export SHELL=3D/bin/sh

    2023-03-30T05:25:11.150946  #

    2023-03-30T05:25:11.251851  / # export SHELL=3D/bin/sh. /lava-9811549/e=
nvironment

    2023-03-30T05:25:11.252097  =


    2023-03-30T05:25:11.353009  / # . /lava-9811549/environment/lava-981154=
9/bin/lava-test-runner /lava-9811549/1

    2023-03-30T05:25:11.353330  =


    2023-03-30T05:25:11.357430  / # /lava-9811549/bin/lava-test-runner /lav=
a-9811549/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251d8aa96d53f1e562f7a4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251d8aa96d53f1e562f7a9
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:26:17.432469  + <8>[   10.449012] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9811687_1.4.2.3.1>

    2023-03-30T05:26:17.432862  set +x

    2023-03-30T05:26:17.538040  #

    2023-03-30T05:26:17.539259  =


    2023-03-30T05:26:17.641608  / # #export SHELL=3D/bin/sh

    2023-03-30T05:26:17.642486  =


    2023-03-30T05:26:17.744220  / # export SHELL=3D/bin/sh. /lava-9811687/e=
nvironment

    2023-03-30T05:26:17.744465  =


    2023-03-30T05:26:17.845390  / # . /lava-9811687/environment/lava-981168=
7/bin/lava-test-runner /lava-9811687/1

    2023-03-30T05:26:17.845728  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251c846158747ec062f7f0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251c846158747ec062f7f5
        failing since 1 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:21:54.067092  <8>[    9.844602] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811618_1.4.2.3.1>

    2023-03-30T05:21:54.070717  + set +x

    2023-03-30T05:21:54.172063  /#

    2023-03-30T05:21:54.273259   # #export SHELL=3D/bin/sh

    2023-03-30T05:21:54.273565  =


    2023-03-30T05:21:54.374504  / # export SHELL=3D/bin/sh. /lava-9811618/e=
nvironment

    2023-03-30T05:21:54.374746  =


    2023-03-30T05:21:54.475579  / # . /lava-9811618/environment/lava-981161=
8/bin/lava-test-runner /lava-9811618/1

    2023-03-30T05:21:54.475991  =


    2023-03-30T05:21:54.480526  / # /lava-9811618/bin/lava-test-runner /lav=
a-9811618/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251cd530c0e5fe4a62f76b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251cd530c0e5fe4a62f770
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:23:13.030014  + set +x<8>[   10.625671] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9811680_1.4.2.3.1>

    2023-03-30T05:23:13.030154  =


    2023-03-30T05:23:13.132793  #

    2023-03-30T05:23:13.233999  / # #export SHELL=3D/bin/sh

    2023-03-30T05:23:13.234220  =


    2023-03-30T05:23:13.335231  / # export SHELL=3D/bin/sh. /lava-9811680/e=
nvironment

    2023-03-30T05:23:13.335458  =


    2023-03-30T05:23:13.436306  / # . /lava-9811680/environment/lava-981168=
0/bin/lava-test-runner /lava-9811680/1

    2023-03-30T05:23:13.436655  =


    2023-03-30T05:23:13.441811  / # /lava-9811680/bin/lava-test-runner /lav=
a-9811680/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251c55d5278862f862f82b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251c55d5278862f862f830
        failing since 1 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:21:08.272687  + set +x<8>[   11.484021] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9811544_1.4.2.3.1>

    2023-03-30T05:21:08.273157  =


    2023-03-30T05:21:08.381222  / # #

    2023-03-30T05:21:08.483921  export SHELL=3D/bin/sh

    2023-03-30T05:21:08.484678  #

    2023-03-30T05:21:08.586654  / # export SHELL=3D/bin/sh. /lava-9811544/e=
nvironment

    2023-03-30T05:21:08.587553  =


    2023-03-30T05:21:08.689238  / # . /lava-9811544/environment/lava-981154=
4/bin/lava-test-runner /lava-9811544/1

    2023-03-30T05:21:08.690762  =


    2023-03-30T05:21:08.695128  / # /lava-9811544/bin/lava-test-runner /lav=
a-9811544/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251cd87feb18cd6262f794

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251cd87feb18cd6262f799
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:23:17.210861  + <8>[   11.584355] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9811657_1.4.2.3.1>

    2023-03-30T05:23:17.211133  set +x

    2023-03-30T05:23:17.316868  / # #

    2023-03-30T05:23:17.419390  export SHELL=3D/bin/sh

    2023-03-30T05:23:17.420203  #

    2023-03-30T05:23:17.522056  / # export SHELL=3D/bin/sh. /lava-9811657/e=
nvironment

    2023-03-30T05:23:17.523062  =


    2023-03-30T05:23:17.625071  / # . /lava-9811657/environment/lava-981165=
7/bin/lava-test-runner /lava-9811657/1

    2023-03-30T05:23:17.626297  =


    2023-03-30T05:23:17.631105  / # /lava-9811657/bin/lava-test-runner /lav=
a-9811657/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64252087e7b6e06f7062f781

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64252087e7b6e06f7062f784
        failing since 84 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-30T05:38:54.841729  <8>[   38.729026] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1190014_1.5.2.4.1>
    2023-03-30T05:38:54.947342  / # #
    2023-03-30T05:38:56.107563  export SHELL=3D/bin/sh
    2023-03-30T05:38:56.113252  #
    2023-03-30T05:38:57.661132  / # export SHELL=3D/bin/sh. /lava-1190014/e=
nvironment
    2023-03-30T05:38:57.666833  =

    2023-03-30T05:39:00.488357  / # . /lava-1190014/environment/lava-119001=
4/bin/lava-test-runner /lava-1190014/1
    2023-03-30T05:39:00.494142  =

    2023-03-30T05:39:00.500513  / # /lava-1190014/bin/lava-test-runner /lav=
a-1190014/1
    2023-03-30T05:39:00.589532  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642521dacf8da014cd62f770

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642521dacf8da014cd62f773
        failing since 84 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-30T05:44:25.069203  + set +x<8>[   67.298304] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1190016_1.5.2.4.1>
    2023-03-30T05:44:25.069510  =

    2023-03-30T05:44:25.177986  / # #
    2023-03-30T05:44:26.337585  export SHELL=3D/bin/sh
    2023-03-30T05:44:26.343185  #
    2023-03-30T05:44:26.343416  / # export SHELL=3D/bin/sh
    2023-03-30T05:44:27.890928  / # . /lava-1190016/environment
    2023-03-30T05:44:30.717671  /lava-1190016/bin/lava-test-runner /lava-11=
90016/1
    2023-03-30T05:44:30.723692  . /lava-1190016/environment
    2023-03-30T05:44:30.723946  / # /lava-1190016/bin/lava-test-runner /lav=
a-1190016/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64251fd9498ec3d2db62f77e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251fd9498ec3d2db62f=
77f
        failing since 334 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642527d804c8765c7c62f79d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642527d804c8765c7c62f=
79e
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251c4a6748eaf57c62f781

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251c4a6748eaf57c62f786
        failing since 1 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:21:07.981732  <8>[   11.434364] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811624_1.4.2.3.1>

    2023-03-30T05:21:08.090303  / # #

    2023-03-30T05:21:08.191450  export SHELL=3D/bin/sh

    2023-03-30T05:21:08.191701  #

    2023-03-30T05:21:08.292779  / # export SHELL=3D/bin/sh. /lava-9811624/e=
nvironment

    2023-03-30T05:21:08.293000  =


    2023-03-30T05:21:08.393992  / # . /lava-9811624/environment/lava-981162=
4/bin/lava-test-runner /lava-9811624/1

    2023-03-30T05:21:08.394590  =


    2023-03-30T05:21:08.398875  / # /lava-9811624/bin/lava-test-runner /lav=
a-9811624/1

    2023-03-30T05:21:08.405666  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64251cc0d8c33230a262f7d3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251cc0d8c33230a262f7d8
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-30T05:23:00.681837  + set<8>[   12.384093] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9811642_1.4.2.3.1>

    2023-03-30T05:23:00.681936   +x

    2023-03-30T05:23:00.786516  / # #

    2023-03-30T05:23:00.887506  export SHELL=3D/bin/sh

    2023-03-30T05:23:00.887717  #

    2023-03-30T05:23:00.988589  / # export SHELL=3D/bin/sh. /lava-9811642/e=
nvironment

    2023-03-30T05:23:00.988784  =


    2023-03-30T05:23:01.089669  / # . /lava-9811642/environment/lava-981164=
2/bin/lava-test-runner /lava-9811642/1

    2023-03-30T05:23:01.089994  =


    2023-03-30T05:23:01.094145  / # /lava-9811642/bin/lava-test-runner /lav=
a-9811642/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64251de3d7f763f47362f7b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251de3d7f763f47362f=
7b9
        failing since 169 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64251de5d7f763f47362f7be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251de5d7f763f47362f=
7bf
        failing since 1 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642520627a12f40a3862f797

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642520627a12f40a3862f=
798
        failing since 104 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64251f72365c98f11f62f784

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-27=
1-g7827aece40de/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251f72365c98f11f62f=
785
        failing since 104 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =20
