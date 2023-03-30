Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D846CFEEF
	for <lists+linux-next@lfdr.de>; Thu, 30 Mar 2023 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjC3Is0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Mar 2023 04:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjC3IsY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Mar 2023 04:48:24 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135DF6A6D
        for <linux-next@vger.kernel.org>; Thu, 30 Mar 2023 01:48:13 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso18859196pjb.3
        for <linux-next@vger.kernel.org>; Thu, 30 Mar 2023 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680166092;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MQvHvGbLoyZ0wp3WMYLppgGX+bOjwZPc1D4aeEndRgM=;
        b=FD7fk+rZbaSkoUf/kYZ1SIdRQMU8jGWOyLcifNBBCAMxYIvW1XzPZkxs4kGut96i22
         q+fxtbRdRYzzr0AklPVXhQIOh3dX95MwLb9W57psrszAMJcxu8F3n+WYuWp3hJNg6C+v
         aNJJWUXAOpsDboONMHsp0avdQisXseFuGznJFmQstNG7HC6OVA0oXYdcwtM+4PeAam7a
         NpOY53LRysyK4oWrHZFGqGAqe9UqmWcevfhTdKRBy3ALrxxxKjTRSm883ID/Nql2Q9bu
         ucsUgESJ0u2afCoKlW26XEDH17yN69kPH0cra3BL7UAeZy7cIsq8Zevtwu7/JUL1Bo+H
         9BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680166092;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQvHvGbLoyZ0wp3WMYLppgGX+bOjwZPc1D4aeEndRgM=;
        b=F1nLe3tUmG3aacsuVvr/4a2zx0wekRJyoEvPalltIxZlOu56f58RVG4RUVGQ0owr0y
         qPMA42Cr8VY208MfreBTUtCsv+y17MIXalKXzP20xD/OPGr5PhjlJ+t06WIxUnkWodWB
         c+xQ0Qix5e/49zT8IxbTclhJ0ka4ydRODxkLFYHdkAvfVuSGb+xoGFZYJ80FiGOkAZpx
         g8z6WAHXwqrInwrFLRq5aGADoviEsBaAqElMI1WIING2leKstKIUnUOXdXGSr9+6EwQd
         C4mKxY/DWNfrnNi+Vcj33gofY+TJWR9+5bVfmjzVluqm6Iqdvhvr1y0wf/Fbif4H7l2K
         6T6w==
X-Gm-Message-State: AAQBX9fsk5IKXaazHEY7HicQFpCt1hqbZWaRItXFm0F7srjFP3oBNSOr
        /Mbf5JliQPDHT+4HT1NXNyWBemFgbV9+LTFD1k3xtQ==
X-Google-Smtp-Source: AKy350ZBK20iWkDGCSBFSdLt6pjjBk67xMTFu+G5OTd7YSLcSUNPUBgHHSHpacLH24UfQmAH80Sz5w==
X-Received: by 2002:a05:6a20:12cd:b0:e3:fbd0:b1f4 with SMTP id v13-20020a056a2012cd00b000e3fbd0b1f4mr645447pzg.29.1680166091531;
        Thu, 30 Mar 2023 01:48:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b21-20020aa78115000000b005a7f8a326a3sm24372289pfi.50.2023.03.30.01.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 01:48:11 -0700 (PDT)
Message-ID: <64254ccb.a70a0220.ac67e.d56a@mx.google.com>
Date:   Thu, 30 Mar 2023 01:48:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230330
Subject: next/master baseline: 676 runs, 35 regressions (next-20230330)
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

next/master baseline: 676 runs, 35 regressions (next-20230330)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230330/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230330
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a6d9e3034536ba4b68ac34490c02267e6eec9c05 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251ddef5acb5213a62f7a0

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4251ddef5acb5213a62f7af
        new failure (last pass: next-20230328)

    2023-03-30T05:27:32.327115  /usr/bin/tpm2_getcap

    2023-03-30T05:27:42.542947  /lava-9811504/1/../bin/lava-test-case

    2023-03-30T05:27:42.550357  <8>[   21.548613] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64251d82a96d53f1e562f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251d82a96d53f1e562f=
76c
        failing since 193 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642518c3e5b4c36cc562f7af

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642518c3e5b4c36cc562f7b4
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328)

    2023-03-30T05:06:01.411198  <8>[   11.032591] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811096_1.4.2.3.1>

    2023-03-30T05:06:01.415049  + set +x

    2023-03-30T05:06:01.523170  / # #

    2023-03-30T05:06:01.625568  export SHELL=3D/bin/sh

    2023-03-30T05:06:01.626361  #

    2023-03-30T05:06:01.728247  / # export SHELL=3D/bin/sh. /lava-9811096/e=
nvironment

    2023-03-30T05:06:01.729075  =


    2023-03-30T05:06:01.830855  / # . /lava-9811096/environment/lava-981109=
6/bin/lava-test-runner /lava-9811096/1

    2023-03-30T05:06:01.832242  =


    2023-03-30T05:06:01.837866  / # /lava-9811096/bin/lava-test-runner /lav=
a-9811096/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251b46ae1b94219162f779

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251b46ae1b94219162f77e
        failing since 1 day (last pass: next-20230324, first fail: next-202=
30328)

    2023-03-30T05:16:32.812428  <8>[   10.767805] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811470_1.4.2.3.1>

    2023-03-30T05:16:32.815598  + set +x

    2023-03-30T05:16:32.920526  / # #

    2023-03-30T05:16:33.021586  export SHELL=3D/bin/sh

    2023-03-30T05:16:33.021800  #

    2023-03-30T05:16:33.122738  / # export SHELL=3D/bin/sh. /lava-9811470/e=
nvironment

    2023-03-30T05:16:33.122960  =


    2023-03-30T05:16:33.223804  / # . /lava-9811470/environment/lava-981147=
0/bin/lava-test-runner /lava-9811470/1

    2023-03-30T05:16:33.224129  =


    2023-03-30T05:16:33.228911  / # /lava-9811470/bin/lava-test-runner /lav=
a-9811470/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642518bee5b4c36cc562f782

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642518bee5b4c36cc562f787
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328)

    2023-03-30T05:05:54.721236  + set +x<8>[   11.355384] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9811147_1.4.2.3.1>

    2023-03-30T05:05:54.721326  =


    2023-03-30T05:05:54.825894  / # #

    2023-03-30T05:05:54.926993  export SHELL=3D/bin/sh

    2023-03-30T05:05:54.927203  #

    2023-03-30T05:05:55.028136  / # export SHELL=3D/bin/sh. /lava-9811147/e=
nvironment

    2023-03-30T05:05:55.028345  =


    2023-03-30T05:05:55.129257  / # . /lava-9811147/environment/lava-981114=
7/bin/lava-test-runner /lava-9811147/1

    2023-03-30T05:05:55.129559  =


    2023-03-30T05:05:55.134498  / # /lava-9811147/bin/lava-test-runner /lav=
a-9811147/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251b823f43a8f44e62f781

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251b823f43a8f44e62f786
        failing since 1 day (last pass: next-20230324, first fail: next-202=
30328)

    2023-03-30T05:17:38.582864  + set<8>[   12.213728] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9811496_1.4.2.3.1>

    2023-03-30T05:17:38.582947   +x

    2023-03-30T05:17:38.687651  / # #

    2023-03-30T05:17:38.788660  export SHELL=3D/bin/sh

    2023-03-30T05:17:38.788911  #

    2023-03-30T05:17:38.889840  / # export SHELL=3D/bin/sh. /lava-9811496/e=
nvironment

    2023-03-30T05:17:38.890101  =


    2023-03-30T05:17:38.991030  / # . /lava-9811496/environment/lava-981149=
6/bin/lava-test-runner /lava-9811496/1

    2023-03-30T05:17:38.991395  =


    2023-03-30T05:17:38.995704  / # /lava-9811496/bin/lava-test-runner /lav=
a-9811496/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642518b9bc4d24887962f7ab

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642518b9bc4d24887962f7b0
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328)

    2023-03-30T05:05:39.972405  <8>[    9.612513] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811108_1.4.2.3.1>

    2023-03-30T05:05:39.975743  + set +x

    2023-03-30T05:05:40.081287  #

    2023-03-30T05:05:40.082407  =


    2023-03-30T05:05:40.184455  / # #export SHELL=3D/bin/sh

    2023-03-30T05:05:40.185205  =


    2023-03-30T05:05:40.286963  / # export SHELL=3D/bin/sh. /lava-9811108/e=
nvironment

    2023-03-30T05:05:40.287693  =


    2023-03-30T05:05:40.389267  / # . /lava-9811108/environment/lava-981110=
8/bin/lava-test-runner /lava-9811108/1

    2023-03-30T05:05:40.390479  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251b22b5f948061562f7cf

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251b22b5f948061562f7d4
        failing since 1 day (last pass: next-20230324, first fail: next-202=
30328)

    2023-03-30T05:15:58.808963  <8>[   10.152601] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811466_1.4.2.3.1>

    2023-03-30T05:15:58.812773  + set +x

    2023-03-30T05:15:58.914513  #

    2023-03-30T05:15:59.015816  / # #export SHELL=3D/bin/sh

    2023-03-30T05:15:59.016165  =


    2023-03-30T05:15:59.117154  / # export SHELL=3D/bin/sh. /lava-9811466/e=
nvironment

    2023-03-30T05:15:59.117534  =


    2023-03-30T05:15:59.218547  / # . /lava-9811466/environment/lava-981146=
6/bin/lava-test-runner /lava-9811466/1

    2023-03-30T05:15:59.218935  =


    2023-03-30T05:15:59.223933  / # /lava-9811466/bin/lava-test-runner /lav=
a-9811466/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64251ad6d3747d657462f780

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251ad6d3747d657462f=
781
        failing since 57 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6425187b28c9d2437262f7a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425187b28c9d2437262f=
7a3
        new failure (last pass: next-20230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642517f1dbe5bdc6e462f79e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642517f1dbe5bdc6e462f=
79f
        new failure (last pass: next-20230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64251e5ad2500b298a62f79c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251e5ad2500b298a62f=
79d
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64251b5e8237599a4062f785

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251b5e8237599a4062f=
786
        new failure (last pass: next-20230327) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64251e05c45990e64562f777

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251e05c45990e64562f77c
        failing since 70 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-03-30T05:28:21.560518  <8>[   14.689827] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3453912_1.5.2.4.1>
    2023-03-30T05:28:21.667906  / # #
    2023-03-30T05:28:21.769923  export SHELL=3D/bin/sh
    2023-03-30T05:28:21.770607  #
    2023-03-30T05:28:21.873978  / # export SHELL=3D/bin/sh. /lava-3453912/e=
nvironment
    2023-03-30T05:28:21.874633  =

    2023-03-30T05:28:21.874905  / # . /lava-3453912/environment<3>[   15.00=
0966] Bluetooth: hci0: command 0xfc18 tx timeout
    2023-03-30T05:28:21.981896  /lava-3453912/bin/lava-test-runner /lava-34=
53912/1
    2023-03-30T05:28:21.982528  =

    2023-03-30T05:28:21.991018  / # /lava-3453912/bin/lava-test-runner /lav=
a-3453912/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642518a4a4f4a9a52a62f7a0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642518a4a4f4a9a52a62f7a5
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328)

    2023-03-30T05:05:30.389841  + set +x

    2023-03-30T05:05:30.396158  <8>[   10.212668] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811111_1.4.2.3.1>

    2023-03-30T05:05:30.501049  / # #

    2023-03-30T05:05:30.602129  export SHELL=3D/bin/sh

    2023-03-30T05:05:30.602284  #

    2023-03-30T05:05:30.703137  / # export SHELL=3D/bin/sh. /lava-9811111/e=
nvironment

    2023-03-30T05:05:30.703289  =


    2023-03-30T05:05:30.804208  / # . /lava-9811111/environment/lava-981111=
1/bin/lava-test-runner /lava-9811111/1

    2023-03-30T05:05:30.804458  =


    2023-03-30T05:05:30.809161  / # /lava-9811111/bin/lava-test-runner /lav=
a-9811111/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251d381ee6912b0b62f792

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251d381ee6912b0b62f797
        failing since 1 day (last pass: next-20230324, first fail: next-202=
30328)

    2023-03-30T05:24:58.865952  + set +x

    2023-03-30T05:24:58.872010  <8>[   10.882292] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811505_1.4.2.3.1>

    2023-03-30T05:24:58.976947  / # #

    2023-03-30T05:24:59.078050  export SHELL=3D/bin/sh

    2023-03-30T05:24:59.078290  #

    2023-03-30T05:24:59.179123  / # export SHELL=3D/bin/sh. /lava-9811505/e=
nvironment

    2023-03-30T05:24:59.179429  =


    2023-03-30T05:24:59.280492  / # . /lava-9811505/environment/lava-981150=
5/bin/lava-test-runner /lava-9811505/1

    2023-03-30T05:24:59.280828  =


    2023-03-30T05:24:59.285299  / # /lava-9811505/bin/lava-test-runner /lav=
a-9811505/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642518ad63bd9ef6b062f76b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642518ad63bd9ef6b062f770
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328)

    2023-03-30T05:05:37.161325  <8>[   10.148908] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811132_1.4.2.3.1>

    2023-03-30T05:05:37.165070  + set +x

    2023-03-30T05:05:37.270570  / #

    2023-03-30T05:05:37.373513  # #export SHELL=3D/bin/sh

    2023-03-30T05:05:37.374266  =


    2023-03-30T05:05:37.476012  / # export SHELL=3D/bin/sh. /lava-9811132/e=
nvironment

    2023-03-30T05:05:37.476995  =


    2023-03-30T05:05:37.579299  / # . /lava-9811132/environment/lava-981113=
2/bin/lava-test-runner /lava-9811132/1

    2023-03-30T05:05:37.580390  =


    2023-03-30T05:05:37.586128  / # /lava-9811132/bin/lava-test-runner /lav=
a-9811132/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251c94319524969a62f795

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251c94319524969a62f79a
        failing since 1 day (last pass: next-20230324, first fail: next-202=
30328)

    2023-03-30T05:22:08.626314  <8>[   10.070577] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811524_1.4.2.3.1>

    2023-03-30T05:22:08.629593  + set +x

    2023-03-30T05:22:08.735058  #

    2023-03-30T05:22:08.838285  / # #export SHELL=3D/bin/sh

    2023-03-30T05:22:08.839157  =


    2023-03-30T05:22:08.940871  / # export SHELL=3D/bin/sh. /lava-9811524/e=
nvironment

    2023-03-30T05:22:08.941094  =


    2023-03-30T05:22:09.042095  / # . /lava-9811524/environment/lava-981152=
4/bin/lava-test-runner /lava-9811524/1

    2023-03-30T05:22:09.042478  =


    2023-03-30T05:22:09.047884  / # /lava-9811524/bin/lava-test-runner /lav=
a-9811524/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642518bdbc4d24887962f7c1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642518bdbc4d24887962f7c6
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328)

    2023-03-30T05:05:54.862609  + <8>[   11.013104] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9811104_1.4.2.3.1>

    2023-03-30T05:05:54.863232  set +x

    2023-03-30T05:05:54.971814  / # #

    2023-03-30T05:05:55.074899  export SHELL=3D/bin/sh

    2023-03-30T05:05:55.075942  #

    2023-03-30T05:05:55.178229  / # export SHELL=3D/bin/sh. /lava-9811104/e=
nvironment

    2023-03-30T05:05:55.179139  =


    2023-03-30T05:05:55.281121  / # . /lava-9811104/environment/lava-981110=
4/bin/lava-test-runner /lava-9811104/1

    2023-03-30T05:05:55.282625  =


    2023-03-30T05:05:55.287880  / # /lava-9811104/bin/lava-test-runner /lav=
a-9811104/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251b1d8c5425062562f791

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251b1d8c5425062562f796
        failing since 1 day (last pass: next-20230324, first fail: next-202=
30328)

    2023-03-30T05:15:58.620706  + <8>[   11.490434] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9811454_1.4.2.3.1>

    2023-03-30T05:15:58.620797  set +x

    2023-03-30T05:15:58.725202  / # #

    2023-03-30T05:15:58.826182  export SHELL=3D/bin/sh

    2023-03-30T05:15:58.826425  #

    2023-03-30T05:15:58.927377  / # export SHELL=3D/bin/sh. /lava-9811454/e=
nvironment

    2023-03-30T05:15:58.927570  =


    2023-03-30T05:15:59.028457  / # . /lava-9811454/environment/lava-981145=
4/bin/lava-test-runner /lava-9811454/1

    2023-03-30T05:15:59.028799  =


    2023-03-30T05:15:59.033745  / # /lava-9811454/bin/lava-test-runner /lav=
a-9811454/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642519716a3718784062f7a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642519716a3718784062f=
7a9
        failing since 352 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6425184a64fcf272bf62f7ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425184a64fcf272bf62f=
7cb
        failing since 50 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64251cded060d484d562f783

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251cded060d484d562f=
784
        failing since 27 days (last pass: next-20230222, first fail: next-2=
0230303) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642518b8bc4d24887962f7a0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642518b8bc4d24887962f7a5
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30328)

    2023-03-30T05:05:42.397975  + <8>[   11.641249] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9811103_1.4.2.3.1>

    2023-03-30T05:05:42.398399  set +x

    2023-03-30T05:05:42.506165  / # #

    2023-03-30T05:05:42.608750  export SHELL=3D/bin/sh

    2023-03-30T05:05:42.609420  #

    2023-03-30T05:05:42.711517  / # export SHELL=3D/bin/sh. /lava-9811103/e=
nvironment

    2023-03-30T05:05:42.712294  =


    2023-03-30T05:05:42.814189  / # . /lava-9811103/environment/lava-981110=
3/bin/lava-test-runner /lava-9811103/1

    2023-03-30T05:05:42.815644  =


    2023-03-30T05:05:42.820089  / # /lava-9811103/bin/lava-test-runner /lav=
a-9811103/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64251b58ae1b94219162f843

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251b58ae1b94219162f848
        failing since 1 day (last pass: next-20230324, first fail: next-202=
30328)

    2023-03-30T05:16:55.429055  <8>[   12.316619] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9811510_1.4.2.3.1>

    2023-03-30T05:16:55.533997  / # #

    2023-03-30T05:16:55.635083  export SHELL=3D/bin/sh

    2023-03-30T05:16:55.635304  #

    2023-03-30T05:16:55.736252  / # export SHELL=3D/bin/sh. /lava-9811510/e=
nvironment

    2023-03-30T05:16:55.736475  =


    2023-03-30T05:16:55.837256  / # . /lava-9811510/environment/lava-981151=
0/bin/lava-test-runner /lava-9811510/1

    2023-03-30T05:16:55.837572  =


    2023-03-30T05:16:55.842464  / # /lava-9811510/bin/lava-test-runner /lav=
a-9811510/1

    2023-03-30T05:16:55.849757  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64251b580cedcf4f6b62f771

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim=
3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim=
3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251b580cedcf4f6b62f=
772
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425161b8c8b5b832d62f7f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425161b8c8b5b832d62f=
7f2
        failing since 64 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425155238fcc903c762f795

  Results:     177 PASS, 8 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-apmixedsys-probed: https://kernelci.org/test=
/case/id/6425155238fcc903c762f820
        failing since 8 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-30T04:51:07.792194  /lava-9810922/1/../bin/lava-test-case

    2023-03-30T04:51:07.798430  <8>[    5.990411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-apmixedsys-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642519ab5e392b896362f83c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642519ab5e392b896362f=
83d
        failing since 218 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642517b441aa8e3d5762f78b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642517b441aa8e3d5762f=
78c
        failing since 15 days (last pass: next-20230310, first fail: next-2=
0230315) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/642534dea1bab1823062f78f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
642534dea1bab1823062f793
        failing since 42 days (last pass: next-20230214, first fail: next-2=
0230215)

    2023-03-30T07:05:44.949461  /lava-9811332/1/../bin/lava-test-case

    2023-03-30T07:05:44.950018  <8>[   36.100907] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-03-30T07:05:44.950469  /lava-9811332/1/../bin/lava-test-case

    2023-03-30T07:05:44.950968  <8>[   36.116603] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-03-30T07:05:44.951398  + set +x

    2023-03-30T07:05:44.951824  <8>[   36.130159] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 9811332_1.5.2.4.5>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64251a25b18e2a27d962f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251a25b18e2a27d962f=
76c
        failing since 127 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6425191d16dd9a591762f78d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425191d16dd9a591762f=
78e
        failing since 127 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64251e0ae34d88028062f79a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64251e0ae34d88028062f=
79b
        failing since 7 days (last pass: next-20230322, first fail: next-20=
230323) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64251678bbd2a3a5e162f76f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230330/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230330/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64251678bbd2a3a5e162f774
        failing since 64 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-03-30T04:56:02.634199  / # #
    2023-03-30T04:56:02.736021  export SHELL=3D/bin/sh
    2023-03-30T04:56:02.736390  #
    2023-03-30T04:56:02.837750  / # export SHELL=3D/bin/sh. /lava-3453622/e=
nvironment
    2023-03-30T04:56:02.838107  =

    2023-03-30T04:56:02.939450  / # . /lava-3453622/environment/lava-345362=
2/bin/lava-test-runner /lava-3453622/1
    2023-03-30T04:56:02.940067  =

    2023-03-30T04:56:02.946462  / # /lava-3453622/bin/lava-test-runner /lav=
a-3453622/1
    2023-03-30T04:56:03.084499  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-30T04:56:03.085024  + cd /lava-3453622/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
