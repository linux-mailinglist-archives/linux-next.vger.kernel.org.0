Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E466CCA5D
	for <lists+linux-next@lfdr.de>; Tue, 28 Mar 2023 21:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjC1TCI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Mar 2023 15:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjC1TCH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Mar 2023 15:02:07 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B302690
        for <linux-next@vger.kernel.org>; Tue, 28 Mar 2023 12:02:03 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso16185870pjb.0
        for <linux-next@vger.kernel.org>; Tue, 28 Mar 2023 12:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680030122;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p1hBTsCuPKpx4ekVbe+/qzaWaM2xu8wRMXRBlt9wL0I=;
        b=yhBC/l3CheDqtP4XK/d+AUwFWqXGIgy9j2nvN04EoBffPykRK5hoJYd7AhVjim++cL
         Rypc63GRtHQtb6lPqhOOEr9kfNjXsG4pxa7uadGkNWQCXpCYoxCvYydUrYllFZPoFB4+
         EDx/rbiWVrWKqOq812SCsrk7yV5yKKyzJNqJB7heG3T/ozvqy9s5vELn21Ua8gh7NBj1
         3WRz/2wMkkdHLzrNrNctRGsaTpGMkeqj1HmQlW14rhfSQgrqWOLSm04k6VkyuWE+H7ps
         jyBJNHc7Dof7Bs238DwGBZu7XestbIn5rNaP8TUB4tWZGFnnfn5zhRiLBaHLaaOby9vH
         y5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680030122;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1hBTsCuPKpx4ekVbe+/qzaWaM2xu8wRMXRBlt9wL0I=;
        b=P2vZGCkX1o/lJpo+aOHfNSrgChwRctqGEqmGfsunGl5MspueSmAhtIxPC6qfLivETl
         AwUVlFCh0/iwbEk+T11Vkr2MY0An5r0/brttax8FbshEFsIlcC/b0sBsCcPyk86lFV87
         xVu+sxKEg+iSkJNTNgTaDZSfIJElWY8zdDTLw7phPenPWYNbA7cDQpB7tYcizxZhrOYi
         uJTmAGvSdQJ+k5fQDkiw5cJWiGrT6kmeMKg3/kC1/lTjEmzn87ZlEKpOPuK9l3Y2Qf/p
         7yCj9crsjWJCjE3uIRhqaIut9O2GePUYIiKW7NzW/uJnxJfJX7og00Ydae+cigVD7V6F
         1SHQ==
X-Gm-Message-State: AAQBX9doHlHX7KbdHHQGcNEbMuzQgKRxFXBl4Eb2DFZ/zjvbEODYFg0E
        y48EHo/ihoqVr6BqMfj2mfOxqbgyqHlivl2UaLU=
X-Google-Smtp-Source: AKy350Yyi6cd8QIUamvp650XR8J1fJCDhtiKB+PUQUeXZpRM8wlfuzlr1cTr0qRP6g8Bj/HwNuFHFA==
X-Received: by 2002:a17:90b:1b0a:b0:23d:2532:ae34 with SMTP id nu10-20020a17090b1b0a00b0023d2532ae34mr14429851pjb.2.1680030121807;
        Tue, 28 Mar 2023 12:02:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k11-20020a170902760b00b001a2104d706fsm9475334pll.225.2023.03.28.12.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 12:02:01 -0700 (PDT)
Message-ID: <642339a9.170a0220.ecb5a.1997@mx.google.com>
Date:   Tue, 28 Mar 2023 12:02:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc4-214-g39ee5bf6e049
Subject: next/pending-fixes baseline: 354 runs,
 27 regressions (v6.3-rc4-214-g39ee5bf6e049)
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

next/pending-fixes baseline: 354 runs, 27 regressions (v6.3-rc4-214-g39ee5b=
f6e049)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx6sx-sdb                   | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc4-214-g39ee5bf6e049/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc4-214-g39ee5bf6e049
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      39ee5bf6e049a12ee0d7f2d0150412a7ae6c5e61 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fcfd80c9b1409262f76c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fcfd80c9b1409262f771
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-28T14:42:57.577024  <8>[    9.900173] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796486_1.4.2.3.1>

    2023-03-28T14:42:57.579899  + set +x

    2023-03-28T14:42:57.684815  / # #

    2023-03-28T14:42:57.785826  export SHELL=3D/bin/sh

    2023-03-28T14:42:57.786045  #

    2023-03-28T14:42:57.886917  / # export SHELL=3D/bin/sh. /lava-9796486/e=
nvironment

    2023-03-28T14:42:57.887139  =


    2023-03-28T14:42:57.988028  / # . /lava-9796486/environment/lava-979648=
6/bin/lava-test-runner /lava-9796486/1

    2023-03-28T14:42:57.988335  =


    2023-03-28T14:42:57.994281  / # /lava-9796486/bin/lava-test-runner /lav=
a-9796486/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642302590ba671489d62f779

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642302590ba671489d62f77e
        new failure (last pass: v6.3-rc3-370-g8269040171a02)

    2023-03-28T15:05:46.220052  <8>[   10.985303] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796728_1.4.2.3.1>

    2023-03-28T15:05:46.222996  + set +x

    2023-03-28T15:05:46.327916  / # #

    2023-03-28T15:05:46.428900  export SHELL=3D/bin/sh

    2023-03-28T15:05:46.429124  #

    2023-03-28T15:05:46.530052  / # export SHELL=3D/bin/sh. /lava-9796728/e=
nvironment

    2023-03-28T15:05:46.530271  =


    2023-03-28T15:05:46.631181  / # . /lava-9796728/environment/lava-979672=
8/bin/lava-test-runner /lava-9796728/1

    2023-03-28T15:05:46.631479  =


    2023-03-28T15:05:46.637656  / # /lava-9796728/bin/lava-test-runner /lav=
a-9796728/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fd0480c9b1409262f795

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fd0480c9b1409262f79a
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-28T14:43:02.775229  + set<8>[    8.945782] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9796491_1.4.2.3.1>

    2023-03-28T14:43:02.775896   +x

    2023-03-28T14:43:02.884182  / # #

    2023-03-28T14:43:02.987033  export SHELL=3D/bin/sh

    2023-03-28T14:43:02.987961  #

    2023-03-28T14:43:03.090157  / # export SHELL=3D/bin/sh. /lava-9796491/e=
nvironment

    2023-03-28T14:43:03.091048  =


    2023-03-28T14:43:03.193116  / # . /lava-9796491/environment/lava-979649=
1/bin/lava-test-runner /lava-9796491/1

    2023-03-28T14:43:03.194449  =


    2023-03-28T14:43:03.199816  / # /lava-9796491/bin/lava-test-runner /lav=
a-9796491/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642302499d31184b2b62f76b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642302499d31184b2b62f770
        new failure (last pass: v6.3-rc3-370-g8269040171a02)

    2023-03-28T15:05:29.500966  + set<8>[    8.924585] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9796740_1.4.2.3.1>

    2023-03-28T15:05:29.501069   +x

    2023-03-28T15:05:29.605814  / # #

    2023-03-28T15:05:29.706914  export SHELL=3D/bin/sh

    2023-03-28T15:05:29.707174  #

    2023-03-28T15:05:29.808157  / # export SHELL=3D/bin/sh. /lava-9796740/e=
nvironment

    2023-03-28T15:05:29.808408  =


    2023-03-28T15:05:29.909409  / # . /lava-9796740/environment/lava-979674=
0/bin/lava-test-runner /lava-9796740/1

    2023-03-28T15:05:29.909747  =


    2023-03-28T15:05:29.914205  / # /lava-9796740/bin/lava-test-runner /lav=
a-9796740/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fd0080c9b1409262f779

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fd0080c9b1409262f77e
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-28T14:43:04.113863  <8>[    7.615090] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796485_1.4.2.3.1>

    2023-03-28T14:43:04.117560  + set +x

    2023-03-28T14:43:04.220635  #

    2023-03-28T14:43:04.321872  / # #export SHELL=3D/bin/sh

    2023-03-28T14:43:04.322876  =


    2023-03-28T14:43:04.424850  / # export SHELL=3D/bin/sh. /lava-9796485/e=
nvironment

    2023-03-28T14:43:04.425638  =


    2023-03-28T14:43:04.527369  / # . /lava-9796485/environment/lava-979648=
5/bin/lava-test-runner /lava-9796485/1

    2023-03-28T14:43:04.528563  =


    2023-03-28T14:43:04.533591  / # /lava-9796485/bin/lava-test-runner /lav=
a-9796485/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64230259826346626862f784

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64230259826346626862f789
        new failure (last pass: v6.3-rc3-370-g8269040171a02)

    2023-03-28T15:05:43.703630  <8>[   10.163275] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796773_1.4.2.3.1>

    2023-03-28T15:05:43.707131  + set +x

    2023-03-28T15:05:43.812190  /#

    2023-03-28T15:05:43.915076   # #export SHELL=3D/bin/sh

    2023-03-28T15:05:43.915772  =


    2023-03-28T15:05:44.017353  / # export SHELL=3D/bin/sh. /lava-9796773/e=
nvironment

    2023-03-28T15:05:44.018056  =


    2023-03-28T15:05:44.119758  / # . /lava-9796773/environment/lava-979677=
3/bin/lava-test-runner /lava-9796773/1

    2023-03-28T15:05:44.120872  =


    2023-03-28T15:05:44.126008  / # /lava-9796773/bin/lava-test-runner /lav=
a-9796773/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fe736d5bf3648662f76d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fe736d5bf3648662f772
        failing since 75 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-28T14:49:11.646612  / # #

    2023-03-28T14:49:11.749518  export SHELL=3D/bin/sh

    2023-03-28T14:49:11.750504  #

    2023-03-28T14:49:11.852442  / # export SHELL=3D/bin/sh. /lava-9796524/e=
nvironment

    2023-03-28T14:49:11.853215  =


    2023-03-28T14:49:11.955216  / # . /lava-9796524/environment/lava-979652=
4/bin/lava-test-runner /lava-9796524/1

    2023-03-28T14:49:11.956390  =


    2023-03-28T14:49:11.967708  / # /lava-9796524/bin/lava-test-runner /lav=
a-9796524/1

    2023-03-28T14:49:12.082278  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-28T14:49:12.082875  + cd /lava-9796524/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6423066d9d6972fb6362f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423066d9d6972fb6362f=
76c
        failing since 29 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642306bc880e61204362f7a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642306bc880e61204362f=
7a1
        failing since 65 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/6422ff0ed5ccb689de62f794

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6422ff0ed5ccb68=
9de62f79b
        failing since 25 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-28T14:51:48.534593  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-28T14:51:48.578367  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-28T14:51:48.578988  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4d19400 pointer offset 4 size 512
    2023-03-28T14:51:48.579371  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-28T14:51:48.579713  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-28T14:51:48.580041  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e6000 allocated at load_module+0x898/0=
x1b10
    2023-03-28T14:51:48.581619  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-28T14:51:48.675065  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-28T14:51:48.675754  kern  :emerg : Process udevd (pid: 71, stac=
k limit =3D 0x9f9e0821)
    2023-03-28T14:51:48.676190  kern  :emerg : Stack: (0xc8985cf8 to 0xc898=
6000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6422ff0ed5ccb68=
9de62f79c
        failing since 428 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-28T14:51:48.486266  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-28T14:51:48.487038  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-28T14:51:48.487620  kern  :alert : 8<--- cut here ---
    2023-03-28T14:51:48.488472  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-28T14:51:48.488935  kern  :alert : [00000060] *pgd=3Dc4a72831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-28T14:51:48.489483  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-28T14:51:48.529950  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8984000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-28T14:51:48.530581  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-28T14:51:48.530969  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-28T14:51:48.531636  kern  :alert : Register r4 infor<8><LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fd2085623ecb6062f794

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fd2085623ecb6062f799
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-28T14:43:27.707973  + <8>[   10.854733] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9796500_1.4.2.3.1>

    2023-03-28T14:43:27.708399  set +x

    2023-03-28T14:43:27.813859  #

    2023-03-28T14:43:27.916977  / # #export SHELL=3D/bin/sh

    2023-03-28T14:43:27.917810  =


    2023-03-28T14:43:28.019661  / # export SHELL=3D/bin/sh. /lava-9796500/e=
nvironment

    2023-03-28T14:43:28.020443  =


    2023-03-28T14:43:28.122412  / # . /lava-9796500/environment/lava-979650=
0/bin/lava-test-runner /lava-9796500/1

    2023-03-28T14:43:28.123655  =


    2023-03-28T14:43:28.128247  / # /lava-9796500/bin/lava-test-runner /lav=
a-9796500/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642302557872b099a462f7b9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642302557872b099a462f7be
        new failure (last pass: v6.3-rc3-370-g8269040171a02)

    2023-03-28T15:05:38.178745  + set +x

    2023-03-28T15:05:38.185037  <8>[   10.314433] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796760_1.4.2.3.1>

    2023-03-28T15:05:38.289828  / # #

    2023-03-28T15:05:38.390826  export SHELL=3D/bin/sh

    2023-03-28T15:05:38.391082  #

    2023-03-28T15:05:38.491982  / # export SHELL=3D/bin/sh. /lava-9796760/e=
nvironment

    2023-03-28T15:05:38.492217  =


    2023-03-28T15:05:38.593187  / # . /lava-9796760/environment/lava-979676=
0/bin/lava-test-runner /lava-9796760/1

    2023-03-28T15:05:38.593563  =


    2023-03-28T15:05:38.598531  / # /lava-9796760/bin/lava-test-runner /lav=
a-9796760/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fcd15f1b4f94b762f862

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fcd15f1b4f94b762f867
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-28T14:42:20.823208  + set<8>[   10.858885] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9796456_1.4.2.3.1>

    2023-03-28T14:42:20.823296   +x

    2023-03-28T14:42:20.925387  /#

    2023-03-28T14:42:21.028063   # #export SHELL=3D/bin/sh

    2023-03-28T14:42:21.028269  =


    2023-03-28T14:42:21.129176  / # export SHELL=3D/bin/sh. /lava-9796456/e=
nvironment

    2023-03-28T14:42:21.129353  =


    2023-03-28T14:42:21.230327  / # . /lava-9796456/environment/lava-979645=
6/bin/lava-test-runner /lava-9796456/1

    2023-03-28T14:42:21.230560  =


    2023-03-28T14:42:21.235685  / # /lava-9796456/bin/lava-test-runner /lav=
a-9796456/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642302580ba671489d62f76b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642302580ba671489d62f770
        new failure (last pass: v6.3-rc3-370-g8269040171a02)

    2023-03-28T15:05:41.315976  <8>[   10.760392] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796730_1.4.2.3.1>

    2023-03-28T15:05:41.319196  + set +x

    2023-03-28T15:05:41.420734  =


    2023-03-28T15:05:41.521729  / # #export SHELL=3D/bin/sh

    2023-03-28T15:05:41.521935  =


    2023-03-28T15:05:41.622785  / # export SHELL=3D/bin/sh. /lava-9796730/e=
nvironment

    2023-03-28T15:05:41.622973  =


    2023-03-28T15:05:41.723853  / # . /lava-9796730/environment/lava-979673=
0/bin/lava-test-runner /lava-9796730/1

    2023-03-28T15:05:41.724124  =


    2023-03-28T15:05:41.729370  / # /lava-9796730/bin/lava-test-runner /lav=
a-9796730/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fd04028c40912962f7a9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fd04028c40912962f7ae
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-28T14:43:01.135577  + set +x<8>[   11.529280] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9796482_1.4.2.3.1>

    2023-03-28T14:43:01.136176  =


    2023-03-28T14:43:01.245067  / # #

    2023-03-28T14:43:01.348153  export SHELL=3D/bin/sh

    2023-03-28T14:43:01.349041  #

    2023-03-28T14:43:01.450883  / # export SHELL=3D/bin/sh. /lava-9796482/e=
nvironment

    2023-03-28T14:43:01.451764  =


    2023-03-28T14:43:01.553853  / # . /lava-9796482/environment/lava-979648=
2/bin/lava-test-runner /lava-9796482/1

    2023-03-28T14:43:01.555264  =


    2023-03-28T14:43:01.559653  / # /lava-9796482/bin/lava-test-runner /lav=
a-9796482/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642302577872b099a462f7cf

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642302577872b099a462f7d4
        new failure (last pass: v6.3-rc3-370-g8269040171a02)

    2023-03-28T15:05:48.144740  + set +x<8>[   11.274073] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9796769_1.4.2.3.1>

    2023-03-28T15:05:48.145203  =


    2023-03-28T15:05:48.253047  / # #

    2023-03-28T15:05:48.355293  export SHELL=3D/bin/sh

    2023-03-28T15:05:48.356130  #

    2023-03-28T15:05:48.457986  / # export SHELL=3D/bin/sh. /lava-9796769/e=
nvironment

    2023-03-28T15:05:48.458762  =


    2023-03-28T15:05:48.560528  / # . /lava-9796769/environment/lava-979676=
9/bin/lava-test-runner /lava-9796769/1

    2023-03-28T15:05:48.560850  =


    2023-03-28T15:05:48.565384  / # /lava-9796769/bin/lava-test-runner /lav=
a-9796769/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sx-sdb                   | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642303f713399b73bd62f7d5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642303f713399b73bd62f7d8
        failing since 82 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-28T15:12:23.494125  <8>[   42.914072] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1188358_1.5.2.4.1>
    2023-03-28T15:12:23.599638  / # #
    2023-03-28T15:12:24.759844  export SHELL=3D/bin/sh
    2023-03-28T15:12:24.765553  #
    2023-03-28T15:12:26.313468  / # export SHELL=3D/bin/sh. /lava-1188358/e=
nvironment
    2023-03-28T15:12:26.319126  =

    2023-03-28T15:12:26.319442  / # . /lava-1188358/environment
    2023-03-28T15:12:29.141595  / # /lava-1188358/bin/lava-test-runner /lav=
a-1188358/1
    2023-03-28T15:12:29.159070  /lava-1188358/bin/lava-test-runner /lava-11=
88358/1
    2023-03-28T15:12:29.250025  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642303defb6fd4028162f78f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642303defb6fd4028162f792
        failing since 82 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-28T15:12:12.033998  / # #
    2023-03-28T15:12:13.193878  export SHELL=3D/bin/sh
    2023-03-28T15:12:13.199593  #
    2023-03-28T15:12:14.747626  / # export SHELL=3D/bin/sh. /lava-1188359/e=
nvironment
    2023-03-28T15:12:14.753339  =

    2023-03-28T15:12:17.574333  / # . /lava-1188359/environment/lava-118835=
9/bin/lava-test-runner /lava-1188359/1
    2023-03-28T15:12:17.579950  =

    2023-03-28T15:12:17.589483  / # /lava-1188359/bin/lava-test-runner /lav=
a-1188359/1
    2023-03-28T15:12:17.637475  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-28T15:12:17.673325  + cd /lava-1188359/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6423040513399b73bd62f83f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6423040513399b73bd62f842
        failing since 82 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-28T15:12:46.215079  + set +x
    2023-03-28T15:12:46.216216  <8>[   67.184070] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1188360_1.5.2.4.1>
    2023-03-28T15:12:46.325697  / # #
    2023-03-28T15:12:47.485461  export SHELL=3D/bin/sh
    2023-03-28T15:12:47.491159  #
    2023-03-28T15:12:47.491483  / # export SHELL=3D/bin/sh
    2023-03-28T15:12:49.038193  / # . /lava-1188360/environment
    2023-03-28T15:12:51.863199  /lava-1188360/bin/lava-test-runner /lava-11=
88360/1
    2023-03-28T15:12:51.869227  . /lava-1188360/environment
    2023-03-28T15:12:51.869526  / # /lava-1188360/bin/lava-test-runner /lav=
a-1188360/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6423042b446295d76962f7d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423042b446295d76962f=
7d5
        failing since 49 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fce12fce6488c662f77b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fce12fce6488c662f780
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-28T14:42:21.437895  <8>[   11.996115] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796467_1.4.2.3.1>

    2023-03-28T14:42:21.543088  / # #

    2023-03-28T14:42:21.644162  export SHELL=3D/bin/sh

    2023-03-28T14:42:21.644373  #

    2023-03-28T14:42:21.745409  / # export SHELL=3D/bin/sh. /lava-9796467/e=
nvironment

    2023-03-28T14:42:21.745635  =


    2023-03-28T14:42:21.846677  / # . /lava-9796467/environment/lava-979646=
7/bin/lava-test-runner /lava-9796467/1

    2023-03-28T14:42:21.847285  =


    2023-03-28T14:42:21.852208  / # /lava-9796467/bin/lava-test-runner /lav=
a-9796467/1

    2023-03-28T14:42:21.858001  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642302547872b099a462f7a3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642302547872b099a462f7a8
        new failure (last pass: v6.3-rc3-370-g8269040171a02)

    2023-03-28T15:05:36.197928  <8>[   11.883520] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9796742_1.4.2.3.1>

    2023-03-28T15:05:36.302470  / # #

    2023-03-28T15:05:36.403533  export SHELL=3D/bin/sh

    2023-03-28T15:05:36.403749  #

    2023-03-28T15:05:36.504645  / # export SHELL=3D/bin/sh. /lava-9796742/e=
nvironment

    2023-03-28T15:05:36.504862  =


    2023-03-28T15:05:36.605773  / # . /lava-9796742/environment/lava-979674=
2/bin/lava-test-runner /lava-9796742/1

    2023-03-28T15:05:36.606075  =


    2023-03-28T15:05:36.610717  / # /lava-9796742/bin/lava-test-runner /lav=
a-9796742/1

    2023-03-28T15:05:36.617141  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64230652f21d34f49962f770

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64230652f21d34f49962f=
771
        failing since 167 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6423026b1ab829110762f7a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423026b1ab829110762f=
7aa
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fc7b540821ff8362f77d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6422fc7b540821ff8362f=
77e
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6422fd6d1c003a334762f770

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-21=
4-g39ee5bf6e049/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6422fd6d1c003a334762f775
        failing since 25 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-03-28T14:44:47.434348  <8>[    9.501501] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3450683_1.5.2.4.1>
    2023-03-28T14:44:47.553477  / # #
    2023-03-28T14:44:47.658966  export SHELL=3D/bin/sh
    2023-03-28T14:44:47.660460  #
    2023-03-28T14:44:47.763783  / # export SHELL=3D/bin/sh. /lava-3450683/e=
nvironment
    2023-03-28T14:44:47.765329  =

    2023-03-28T14:44:47.868611  / # . /lava-3450683/environment/lava-345068=
3/bin/lava-test-runner /lava-3450683/1
    2023-03-28T14:44:47.871302  =

    2023-03-28T14:44:47.879230  / # /lava-3450683/bin/lava-test-runner /lav=
a-3450683/1
    2023-03-28T14:44:47.975082  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
