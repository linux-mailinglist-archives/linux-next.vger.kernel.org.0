Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3BDE6CD37E
	for <lists+linux-next@lfdr.de>; Wed, 29 Mar 2023 09:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjC2Hmp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Mar 2023 03:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjC2Hmm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Mar 2023 03:42:42 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F2C10DC
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2023 00:42:36 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id ja10so14136588plb.5
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2023 00:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680075756;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTCCGM5XeIuyJExmHBIkjJ1Reb0ov7BlpyWREODTJI8=;
        b=dI+YUqLIzz6O5NADCeue9J3YC1NTMw3RK0huvO5GGtvY+vZcNT3pegASdVBJNPhRTs
         RXnP0mpfpX2kq4H9ZFKvhCfxFysHeS/bwTyBJEDnQvb1YnBQKiTT2W8clLvCcVictETU
         AmF9gpaZ8XQ2nXZWCg9tQdoPmg4hynnqW7MezZwq1H1VI8TxYogVDbcHNb2WZSSfearC
         0hM/GfwEvnhT3XNX8t6EFIvqCU42MajQV6ApWsGfiu4ZGMApY5o0de/HNRYa3kVtcYYp
         QUCeAKQCNXSMtp4gWE4b6rCm3XQKruWEYAiuL7suc/SxXuEnXtsjminq69sP3gbTH70x
         /cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680075756;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTCCGM5XeIuyJExmHBIkjJ1Reb0ov7BlpyWREODTJI8=;
        b=Mb1IGw38yEC26eSqjRwQkDpcrxiGfXkhFe/LNP2gsKPray7JVjFL3IS+7TaNfZO3NO
         sDM8p0GhN8oryQwcC75a83EWEZKAGFBEvDGKQTTztRiM76af9JtOELvnFDr4cu48gKwb
         UYgtJtV8BVODDYy+XlY0cphvA5yUaXLCoHTKnsHKpwRDFc7Z3Hd9K4BuMfLW1G8OONEh
         83alkA2YwXz7WLDyr8rlfKecoZKY4FVksIN5N9lk2sLJDso9DLfaq4Fwj5P5yg/R1cpU
         BDUxDq+kXEuvpaZH60RTlM7k2UTysoSJJif9iXsfECvJhmLjYbJel/1L5OTW+5PaELXP
         czEg==
X-Gm-Message-State: AO0yUKUEGmI6rUCCgczvjdRCAT9bb9JkpCMfwpYH7gJxIWjvSXPK6MyK
        eV9QCG1A2FGCXjRn4MAuYKe/FROPXm8O2Da5fegTKA==
X-Google-Smtp-Source: AK7set+xS6oz3Xs/yDNLrlWyJZf9K9OA2tGeCnPJ8zCJWQ2zahxmiY9Ds1O3XWXh+YIi+kzyVW5Bew==
X-Received: by 2002:a05:6a20:4f9e:b0:d4:32bb:11bd with SMTP id gh30-20020a056a204f9e00b000d432bb11bdmr12463128pzb.45.1680075755092;
        Wed, 29 Mar 2023 00:42:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7804d000000b00592626fe48csm5345348pfm.122.2023.03.29.00.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 00:42:34 -0700 (PDT)
Message-ID: <6423ebea.a70a0220.f8dac.a2d3@mx.google.com>
Date:   Wed, 29 Mar 2023 00:42:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc4-243-ga0c0d56fba87
Subject: next/pending-fixes baseline: 378 runs,
 27 regressions (v6.3-rc4-243-ga0c0d56fba87)
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

next/pending-fixes baseline: 378 runs, 27 regressions (v6.3-rc4-243-ga0c0d5=
6fba87)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc4-243-ga0c0d56fba87/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc4-243-ga0c0d56fba87
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a0c0d56fba87d456105a36590837689ce63bc1a2 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b1a6e9a7dd6d7462f7a3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b1a6e9a7dd6d7462f7a8
        failing since 0 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-29T03:33:51.790093  <8>[    9.740916] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9802358_1.4.2.3.1>

    2023-03-29T03:33:51.793982  + set +x

    2023-03-29T03:33:51.902228  / # #

    2023-03-29T03:33:52.005226  export SHELL=3D/bin/sh

    2023-03-29T03:33:52.006098  #

    2023-03-29T03:33:52.108057  / # export SHELL=3D/bin/sh. /lava-9802358/e=
nvironment

    2023-03-29T03:33:52.108977  =


    2023-03-29T03:33:52.210779  / # . /lava-9802358/environment/lava-980235=
8/bin/lava-test-runner /lava-9802358/1

    2023-03-29T03:33:52.211059  =


    2023-03-29T03:33:52.216125  / # /lava-9802358/bin/lava-test-runner /lav=
a-9802358/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b19f2a98933d8162f77c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b19f2a98933d8162f781
        failing since 0 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-29T03:33:27.377827  + set<8>[   10.987766] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9802403_1.4.2.3.1>

    2023-03-29T03:33:27.377922   +x

    2023-03-29T03:33:27.482654  / # #

    2023-03-29T03:33:27.583667  export SHELL=3D/bin/sh

    2023-03-29T03:33:27.583882  #

    2023-03-29T03:33:27.684769  / # export SHELL=3D/bin/sh. /lava-9802403/e=
nvironment

    2023-03-29T03:33:27.685011  =


    2023-03-29T03:33:27.785917  / # . /lava-9802403/environment/lava-980240=
3/bin/lava-test-runner /lava-9802403/1

    2023-03-29T03:33:27.786330  =


    2023-03-29T03:33:27.790586  / # /lava-9802403/bin/lava-test-runner /lav=
a-9802403/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b1a0a03795430262f79d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b1a0a03795430262f7a2
        failing since 0 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-29T03:33:29.572877  <8>[    9.685715] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9802393_1.4.2.3.1>

    2023-03-29T03:33:29.575954  + set +x

    2023-03-29T03:33:29.679575  #

    2023-03-29T03:33:29.680753  =


    2023-03-29T03:33:29.782811  / # #export SHELL=3D/bin/sh

    2023-03-29T03:33:29.783397  =


    2023-03-29T03:33:29.884945  / # export SHELL=3D/bin/sh. /lava-9802393/e=
nvironment

    2023-03-29T03:33:29.885395  =


    2023-03-29T03:33:29.986873  / # . /lava-9802393/environment/lava-980239=
3/bin/lava-test-runner /lava-9802393/1

    2023-03-29T03:33:29.988082  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b45687d0009ad662f778

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b45687d0009ad662f77d
        failing since 76 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-29T03:45:10.571250  / # #

    2023-03-29T03:45:10.672961  export SHELL=3D/bin/sh

    2023-03-29T03:45:10.673405  #

    2023-03-29T03:45:10.774710  / # export SHELL=3D/bin/sh. /lava-9802509/e=
nvironment

    2023-03-29T03:45:10.775117  =


    2023-03-29T03:45:10.876467  / # . /lava-9802509/environment/lava-980250=
9/bin/lava-test-runner /lava-9802509/1

    2023-03-29T03:45:10.877462  =


    2023-03-29T03:45:10.919322  / # /lava-9802509/bin/lava-test-runner /lav=
a-9802509/1

    2023-03-29T03:45:11.003868  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-29T03:45:11.004147  + cd /lava-9802509/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b4449b8940292262f7b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b4449b8940292262f7b6
        failing since 70 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-29T03:44:43.949357  <8>[   14.994183] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3452278_1.5.2.4.1>
    2023-03-29T03:44:44.056067  / # #
    2023-03-29T03:44:44.157617  export SHELL=3D/bin/sh
    2023-03-29T03:44:44.158020  #
    2023-03-29T03:44:44.259269  / # export SHELL=3D/bin/sh. /lava-3452278/e=
nvironment
    2023-03-29T03:44:44.259641  =

    2023-03-29T03:44:44.259799  / # . /lava-3452278/environment<3>[   15.30=
1606] Bluetooth: hci0: command 0xfc18 tx timeout
    2023-03-29T03:44:44.360966  /lava-3452278/bin/lava-test-runner /lava-34=
52278/1
    2023-03-29T03:44:44.361556  =

    2023-03-29T03:44:44.366585  / # /lava-3452278/bin/lava-test-runner /lav=
a-3452278/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b4c953e746454962f78c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b4c953e746454962f791
        failing since 70 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-29T03:47:06.345450  <8>[   24.233841] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3452329_1.5.2.4.1>
    2023-03-29T03:47:06.452099  / # #
    2023-03-29T03:47:06.553667  export SHELL=3D/bin/sh
    2023-03-29T03:47:06.554071  #
    2023-03-29T03:47:06.655272  / # export SHELL=3D/bin/sh. /lava-3452329/e=
nvironment
    2023-03-29T03:47:06.655711  =

    2023-03-29T03:47:06.757069  / # . /lava-3452329/environment/lava-345232=
9/bin/lava-test-runner /lava-3452329/1
    2023-03-29T03:47:06.757672  =

    2023-03-29T03:47:06.761782  / # /lava-3452329/bin/lava-test-runner /lav=
a-3452329/1
    2023-03-29T03:47:06.850442  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b7b28429f6bfc362f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b7b28429f6bfc362f770
        failing since 70 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-29T03:59:18.392841  <8>[   14.517347] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3452370_1.5.2.4.1>
    2023-03-29T03:59:18.499322  / # #
    2023-03-29T03:59:18.600914  export SHELL=3D/bin/sh
    2023-03-29T03:59:18.601292  #
    2023-03-29T03:59:18.702499  / # export SHELL=3D/bin/sh. /lava-3452370/e=
nvironment
    2023-03-29T03:59:18.702872  =

    2023-03-29T03:59:18.804327  / # . /lava-3452370/environment/lava-345237=
0/bin/lava-test-runner /lava-3452370/1
    2023-03-29T03:59:18.805738  =

    2023-03-29T03:59:18.810574  / # /lava-3452370/bin/lava-test-runner /lav=
a-3452370/1
    2023-03-29T03:59:18.901580  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/6423b0d351da3b154d62f77c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6423b0d351da3b1=
54d62f783
        failing since 26 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-29T03:30:10.172883  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-29T03:30:10.217346  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-29T03:30:10.218013  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b3a200 pointer offset 4 size 512
    2023-03-29T03:30:10.218412  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-29T03:30:10.218771  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-29T03:30:10.219110  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e6000 allocated at load_module+0x898/0=
x1b10
    2023-03-29T03:30:10.220764  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-29T03:30:10.312898  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-29T03:30:10.313596  kern  :emerg : Process udevd (pid: 63, stac=
k limit =3D 0x69777b8e)
    2023-03-29T03:30:10.314105  kern  :emerg : Stack: (0xc88d9cf8 to 0xc88d=
a000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6423b0d351da3b1=
54d62f784
        failing since 429 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-29T03:30:10.125525  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-29T03:30:10.126348  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-29T03:30:10.126800  kern  :alert : 8<--- cut here ---
    2023-03-29T03:30:10.127573  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-29T03:30:10.128019  kern  :alert : [00000060] *pgd=3Dc49c0831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-29T03:30:10.128415  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-29T03:30:10.168537  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88d8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-29T03:30:10.169168  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-29T03:30:10.169896  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-29T03:30:10.170283  kern  :alert : Register r4 infor<8><LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b18bc189c823f862f77d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b18bc189c823f862f782
        failing since 0 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-29T03:33:22.580774  + set +x

    2023-03-29T03:33:22.587385  <8>[   10.420437] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9802349_1.4.2.3.1>

    2023-03-29T03:33:22.692017  / # #

    2023-03-29T03:33:22.793030  export SHELL=3D/bin/sh

    2023-03-29T03:33:22.793247  #

    2023-03-29T03:33:22.894040  / # export SHELL=3D/bin/sh. /lava-9802349/e=
nvironment

    2023-03-29T03:33:22.894271  =


    2023-03-29T03:33:22.995202  / # . /lava-9802349/environment/lava-980234=
9/bin/lava-test-runner /lava-9802349/1

    2023-03-29T03:33:22.995503  =


    2023-03-29T03:33:22.999530  / # /lava-9802349/bin/lava-test-runner /lav=
a-9802349/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b1948d1ecfd64b62f7b1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b1948d1ecfd64b62f7b6
        failing since 0 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-29T03:33:33.245706  + set +x

    2023-03-29T03:33:33.252673  <8>[   10.626824] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9802379_1.4.2.3.1>

    2023-03-29T03:33:33.360433  #

    2023-03-29T03:33:33.361676  =


    2023-03-29T03:33:33.463919  / # #export SHELL=3D/bin/sh

    2023-03-29T03:33:33.464712  =


    2023-03-29T03:33:33.566523  / # export SHELL=3D/bin/sh. /lava-9802379/e=
nvironment

    2023-03-29T03:33:33.567117  =


    2023-03-29T03:33:33.668624  / # . /lava-9802379/environment/lava-980237=
9/bin/lava-test-runner /lava-9802379/1

    2023-03-29T03:33:33.669162  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b1a61f9a56409e62f774

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b1a61f9a56409e62f779
        failing since 0 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-29T03:33:50.890415  + set<8>[   11.006525] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9802362_1.4.2.3.1>

    2023-03-29T03:33:50.891037   +x

    2023-03-29T03:33:50.999700  / # #

    2023-03-29T03:33:51.102726  export SHELL=3D/bin/sh

    2023-03-29T03:33:51.103756  #

    2023-03-29T03:33:51.205653  / # export SHELL=3D/bin/sh. /lava-9802362/e=
nvironment

    2023-03-29T03:33:51.206558  =


    2023-03-29T03:33:51.308557  / # . /lava-9802362/environment/lava-980236=
2/bin/lava-test-runner /lava-9802362/1

    2023-03-29T03:33:51.310050  =


    2023-03-29T03:33:51.314448  / # /lava-9802362/bin/lava-test-runner /lav=
a-9802362/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b437a7ad9277d262f7e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b437a7ad9277d262f7ec
        failing since 83 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-29T03:44:31.497892  + set<8>[   38.841126] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1188967_1.5.2.4.1>
    2023-03-29T03:44:31.498034   +x
    2023-03-29T03:44:31.601844  / # #
    2023-03-29T03:44:32.760702  export SHELL=3D/bin/sh
    2023-03-29T03:44:32.766219  #
    2023-03-29T03:44:34.312918  / # export SHELL=3D/bin/sh. /lava-1188967/e=
nvironment
    2023-03-29T03:44:34.318661  =

    2023-03-29T03:44:37.140023  / # . /lava-1188967/environment/lava-118896=
7/bin/lava-test-runner /lava-1188967/1
    2023-03-29T03:44:37.146083  =

    2023-03-29T03:44:37.158719  / # /lava-1188967/bin/lava-test-runner /lav=
a-1188967/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b487302195948f62f7ba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b487302195948f62f7bd
        failing since 83 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-29T03:45:44.165802  + set +x<8>[   67.043278] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1188966_1.5.2.4.1>
    2023-03-29T03:45:44.166117  =

    2023-03-29T03:45:44.275791  / # #
    2023-03-29T03:45:45.436269  export SHELL=3D/bin/sh
    2023-03-29T03:45:45.441979  #
    2023-03-29T03:45:45.442298  / # export SHELL=3D/bin/sh
    2023-03-29T03:45:46.990121  / # . /lava-1188966/environment
    2023-03-29T03:45:49.817218  /lava-1188966/bin/lava-test-runner /lava-11=
88966/1
    2023-03-29T03:45:49.823205  . /lava-1188966/environment
    2023-03-29T03:45:49.823473  / # /lava-1188966/bin/lava-test-runner /lav=
a-1188966/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b03081dfc3a61062f7e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423b03081dfc3a61062f=
7e6
        failing since 333 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b189bf5c18f0ed62f7be

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b189bf5c18f0ed62f7c3
        failing since 0 day (last pass: v6.3-rc3-370-g8269040171a02, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-29T03:33:16.051866  <8>[   11.355028] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9802347_1.4.2.3.1>

    2023-03-29T03:33:16.156745  / # #

    2023-03-29T03:33:16.257709  export SHELL=3D/bin/sh

    2023-03-29T03:33:16.257900  #

    2023-03-29T03:33:16.358612  / # export SHELL=3D/bin/sh. /lava-9802347/e=
nvironment

    2023-03-29T03:33:16.358816  =


    2023-03-29T03:33:16.459714  / # . /lava-9802347/environment/lava-980234=
7/bin/lava-test-runner /lava-9802347/1

    2023-03-29T03:33:16.460018  =


    2023-03-29T03:33:16.464483  / # /lava-9802347/bin/lava-test-runner /lav=
a-9802347/1

    2023-03-29T03:33:16.471177  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6423b4d70a945bc88162f76e

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/642=
3b4d70a945bc88162f7be
        failing since 34 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-29T03:47:06.246115  /lava-9802556/1/../bin/lava-test-case

    2023-03-29T03:47:06.256510  <8>[   23.427558] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6423b4d70a945bc88162f810
        failing since 30 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-29T03:47:03.373548  /lava-9802556/1/../bin/lava-test-case

    2023-03-29T03:47:03.383756  <8>[   20.555144] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6423b4d70a945bc88162f811
        failing since 30 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-29T03:47:02.232156  <3>[   19.407110] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-03-29T03:47:02.238667  <3>[   19.407144] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-03-29T03:47:02.346336  /lava-9802556/1/../bin/lava-test-case

    2023-03-29T03:47:02.356107  <8>[   19.527740] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6423b4d0d9cba575de62f80b

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/6423b4d0d9cba575de62f8bd
        failing since 30 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-29T03:47:02.462091  /lava-9802566/1/../bin/lava-test-case

    2023-03-29T03:47:02.468358  <8>[   20.982135] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/6423b4d0d9cba575de62f8be
        failing since 30 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-29T03:47:01.443007  /lava-9802566/1/../bin/lava-test-case

    2023-03-29T03:47:01.449329  <8>[   19.962730] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/6423b4d0d9cba575de62f8bf
        failing since 30 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-29T03:47:00.422681  /lava-9802566/1/../bin/lava-test-case

    2023-03-29T03:47:00.429025  <8>[   18.942981] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b1898d1ecfd64b62f76c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423b1898d1ecfd64b62f=
76d
        failing since 0 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b1efae5da3a95262f7b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423b1efae5da3a95262f=
7b5
        failing since 0 day (last pass: v6.3-rc3-550-g902f54bbd6c7, first f=
ail: v6.3-rc4-214-g39ee5bf6e049) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b0924c1e33e75962f783

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423b0924c1e33e75962f=
784
        failing since 103 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6423afa1407a3d7c2962f7ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423afa1407a3d7c2962f=
7ed
        failing since 103 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6423b54f5589dd79c962f7b5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-24=
3-ga0c0d56fba87/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423b54f5589dd79c962f7ba
        failing since 26 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-03-29T03:49:26.234482  / # #
    2023-03-29T03:49:26.340215  export SHELL=3D/bin/sh
    2023-03-29T03:49:26.341966  #
    2023-03-29T03:49:26.445384  / # export SHELL=3D/bin/sh. /lava-3452364/e=
nvironment
    2023-03-29T03:49:26.446991  =

    2023-03-29T03:49:26.550467  / # . /lava-3452364/environment/lava-345236=
4/bin/lava-test-runner /lava-3452364/1
    2023-03-29T03:49:26.553317  =

    2023-03-29T03:49:26.559815  / # /lava-3452364/bin/lava-test-runner /lav=
a-3452364/1
    2023-03-29T03:49:26.724556  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-29T03:49:26.725730  + cd /lava-3452364/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
