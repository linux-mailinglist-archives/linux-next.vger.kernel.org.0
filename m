Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36E679D11C
	for <lists+linux-next@lfdr.de>; Tue, 12 Sep 2023 14:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbjILMas (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Sep 2023 08:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235234AbjILMae (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Sep 2023 08:30:34 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212029F
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 05:30:30 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c336f5b1ffso46498275ad.2
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 05:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694521829; x=1695126629; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IagqQjfcUzn/SIVzqcka5+nsnBccnIsv/tsdoALsbgc=;
        b=v9B5wQNtTroZRWfc5+U2hZQLB91h3+Gw4BS+/579GnZr/0OGmfIsg+InbszEXKMuDY
         CJwVDfox6L4tD50dTqZNTeEtybxYbNnyfXKvFrf+I2xkTTA0L4D+GwSDsH0XzNyLpy8x
         4MthNv0LzkfCKtSr65EPSj/JYLVWzYKuN54yEjWMv4Oa2p8PcwUYlLJIHFdDSgOFQKsp
         /gINfI4oTIvuMCyUAQ2YlyI2w8PW8H/bDPECADkaHpnVw0NvfXEOnTXePyrrY689IchF
         ejEOK9JNh2MFl3OuTJllEP9ufFu5HITTwhSV2s4xMZ6EBNEVilm/vcjC7OQzKeWIvRxu
         IQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694521829; x=1695126629;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IagqQjfcUzn/SIVzqcka5+nsnBccnIsv/tsdoALsbgc=;
        b=bRfes+UhSYMArETZ0Ww1xvzbUoJuRL5IIJbYaBwltXQCeLZeM8Au3+hafQuMJpQWbB
         rQSa1wNZEWgPuk6Jh/whsr71p1U4DFJIV88mqTldykIDFYRzrYLet1L/vkj25bMxWDj1
         flJXuw3FCBqlemkiyCcarSxiPeFsG4R5zNUzNGQ/xooPFQfUNqE9psJOGLC/lSQuOnw/
         2D9k7zzjFdNq6Evm2aBH9KCVIlw0xMEQzfrkAk5R4NSAJ+k4gf9mx8NOAEsDQadBT4Uk
         Y5o4eZZ62UnScjOLEZOyYMkaxZP8IXN8LwvG6zhN7VROvMPvy0NK/xeK153q4i/v8n4n
         T6ug==
X-Gm-Message-State: AOJu0YzMew3t6OgTATK/YQVO1EkXB35QL61RpG9m02DuRUJEGlHcy9Ku
        yNNLhdZHtEiKgVl20Hx/cd9rkqU4eP+PMLEunEE=
X-Google-Smtp-Source: AGHT+IHlHxf8DR2shePIpgQINjprp6ZZuvubF9/yW3iYxOkD/ACj3lFWnVeAz1CVaZ0Wq8jQczuKQA==
X-Received: by 2002:a17:90b:3689:b0:26d:2162:f596 with SMTP id mj9-20020a17090b368900b0026d2162f596mr11106405pjb.6.1694521828481;
        Tue, 12 Sep 2023 05:30:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 26-20020a17090a005a00b0025dc5749b4csm9852690pjb.21.2023.09.12.05.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 05:30:27 -0700 (PDT)
Message-ID: <650059e3.170a0220.7c9fe.a2cb@mx.google.com>
Date:   Tue, 12 Sep 2023 05:30:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230912
X-Kernelci-Report-Type: test
Subject: next/master baseline: 333 runs, 30 regressions (next-20230912)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 333 runs, 30 regressions (next-20230912)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =

r8a77960-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230912/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230912
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3c13c772fc233a10342c8e1605ff0855dfdf0c89 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65001ed4e6558574928a0a50

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001ed4e6558574928a0a65
        failing since 14 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-12T08:18:16.214551  + <8>[   10.507431] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11504336_1.4.2.3.1>

    2023-09-12T08:18:16.214636  set +x

    2023-09-12T08:18:16.318761  / # #

    2023-09-12T08:18:16.419350  export SHELL=3D/bin/sh

    2023-09-12T08:18:16.419529  #

    2023-09-12T08:18:16.520044  / # export SHELL=3D/bin/sh. /lava-11504336/=
environment

    2023-09-12T08:18:16.520201  =


    2023-09-12T08:18:16.620702  / # . /lava-11504336/environment/lava-11504=
336/bin/lava-test-runner /lava-11504336/1

    2023-09-12T08:18:16.620942  =


    2023-09-12T08:18:16.624927  / # /lava-11504336/bin/lava-test-runner /la=
va-11504336/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650023ad2db05d58738a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650023ad2db05d58738a0=
a54
        failing since 118 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650021a0b6031b99bf8a0a8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650021a0b6031b99bf8a0=
a8b
        failing since 118 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65001eb973a8c4a8908a0a46

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001eb973a8c4a8908a0a5b
        failing since 14 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-12T08:18:10.503697  + <8>[   10.305519] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11504357_1.4.2.3.1>

    2023-09-12T08:18:10.503811  set +x

    2023-09-12T08:18:10.608077  / # #

    2023-09-12T08:18:10.708605  export SHELL=3D/bin/sh

    2023-09-12T08:18:10.708747  #

    2023-09-12T08:18:10.809218  / # export SHELL=3D/bin/sh. /lava-11504357/=
environment

    2023-09-12T08:18:10.809373  =


    2023-09-12T08:18:10.909854  / # . /lava-11504357/environment/lava-11504=
357/bin/lava-test-runner /lava-11504357/1

    2023-09-12T08:18:10.910074  =


    2023-09-12T08:18:10.914885  / # /lava-11504357/bin/lava-test-runner /la=
va-11504357/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6500214d803f3eee368a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6500214d803f3eee368a0=
a51
        failing since 118 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65001ec3899bab54a48a0a42

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001ec3899bab54a48a0a57
        failing since 14 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-12T08:17:58.162753  + <8>[   10.683897] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11504339_1.4.2.3.1>

    2023-09-12T08:17:58.163185  set +x

    2023-09-12T08:17:58.270170  / # #

    2023-09-12T08:17:58.372283  export SHELL=3D/bin/sh

    2023-09-12T08:17:58.373010  #

    2023-09-12T08:17:58.474415  / # export SHELL=3D/bin/sh. /lava-11504339/=
environment

    2023-09-12T08:17:58.475167  =


    2023-09-12T08:17:58.576557  / # . /lava-11504339/environment/lava-11504=
339/bin/lava-test-runner /lava-11504339/1

    2023-09-12T08:17:58.577707  =


    2023-09-12T08:17:58.582301  / # /lava-11504339/bin/lava-test-runner /la=
va-11504339/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65002399dab41da1f68a0a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65002399dab41da1f68a0=
a59
        failing since 118 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6500219ccb2d326bea8a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6500219ccb2d326bea8a0=
a44
        failing since 118 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65001cf608b4f2d1f08a0afb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001cf608b4f2d1f08a0b04
        failing since 27 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-12T08:10:08.394324  + set<8>[   28.313010] <LAVA_SIGNAL_ENDRUN =
0_dmesg 101836_1.5.2.4.1>
    2023-09-12T08:10:08.394897   +x
    2023-09-12T08:10:08.500903  / # #
    2023-09-12T08:10:09.666715  export SHELL=3D/bin/sh
    2023-09-12T08:10:09.672853  #
    2023-09-12T08:10:11.171587  / # export SHELL=3D/bin/sh. /lava-101836/en=
vironment
    2023-09-12T08:10:11.177651  =

    2023-09-12T08:10:13.900644  / # . /lava-101836/environment/lava-101836/=
bin/lava-test-runner /lava-101836/1
    2023-09-12T08:10:13.907407  =

    2023-09-12T08:10:13.914311  / # /lava-101836/bin/lava-test-runner /lava=
-101836/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65001fdbe4aee4da0c8a0a50

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001fdbe4aee4da0c8a0a59
        failing since 27 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-12T08:22:28.623151  + set<8>[   28.887299] <LAVA_SIGNAL_ENDRUN =
0_dmesg 101876_1.5.2.4.1>
    2023-09-12T08:22:28.623729   +x
    2023-09-12T08:22:28.732816  / # #
    2023-09-12T08:22:29.898350  export SHELL=3D/bin/sh
    2023-09-12T08:22:29.904452  #
    2023-09-12T08:22:31.403727  / # export SHELL=3D/bin/sh. /lava-101876/en=
vironment
    2023-09-12T08:22:31.409716  =

    2023-09-12T08:22:34.133308  / # . /lava-101876/environment/lava-101876/=
bin/lava-test-runner /lava-101876/1
    2023-09-12T08:22:34.140007  =

    2023-09-12T08:22:34.145591  / # /lava-101876/bin/lava-test-runner /lava=
-101876/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65001a75eea32231788a0a44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001a75eea32231788a0a4d
        failing since 27 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-12T07:59:26.358520  + set<8>[   27.381285] <LAVA_SIGNAL_ENDRUN =
0_dmesg 101780_1.5.2.4.1>
    2023-09-12T07:59:26.358924   +x
    2023-09-12T07:59:26.471677  / # #
    2023-09-12T07:59:27.633962  export SHELL=3D/bin/sh
    2023-09-12T07:59:27.639941  #
    2023-09-12T07:59:29.134232  / # export SHELL=3D/bin/sh. /lava-101780/en=
vironment
    2023-09-12T07:59:29.140255  =

    2023-09-12T07:59:31.855737  / # . /lava-101780/environment/lava-101780/=
bin/lava-test-runner /lava-101780/1
    2023-09-12T07:59:31.862479  =

    2023-09-12T07:59:31.878538  / # /lava-101780/bin/lava-test-runner /lava=
-101780/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65001f4f22ce43b9998a0a8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001f4f22ce43b9998a0a94
        failing since 27 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-12T08:20:04.300375  + set<8>[   29.411129] <LAVA_SIGNAL_ENDRUN =
0_dmesg 101870_1.5.2.4.1>
    2023-09-12T08:20:04.300808   +x
    2023-09-12T08:20:04.409696  / # #
    2023-09-12T08:20:05.575619  export SHELL=3D/bin/sh
    2023-09-12T08:20:05.581713  #
    2023-09-12T08:20:07.080952  / # export SHELL=3D/bin/sh. /lava-101870/en=
vironment
    2023-09-12T08:20:07.087060  =

    2023-09-12T08:20:09.810419  / # . /lava-101870/environment/lava-101870/=
bin/lava-test-runner /lava-101870/1
    2023-09-12T08:20:09.817192  =

    2023-09-12T08:20:09.820704  / # /lava-101870/bin/lava-test-runner /lava=
-101870/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65002067a26293b25c8a0a5e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65002067a26293b25c8a0a67
        failing since 27 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-12T08:24:52.894933  + set<8>[   28.482006] <LAVA_SIGNAL_ENDRUN =
0_dmesg 101898_1.5.2.4.1>
    2023-09-12T08:24:52.895549   +x
    2023-09-12T08:24:53.003930  / # #
    2023-09-12T08:24:54.170335  export SHELL=3D/bin/sh
    2023-09-12T08:24:54.176449  #
    2023-09-12T08:24:55.675453  / # export SHELL=3D/bin/sh. /lava-101898/en=
vironment
    2023-09-12T08:24:55.681517  =

    2023-09-12T08:24:58.405058  / # . /lava-101898/environment/lava-101898/=
bin/lava-test-runner /lava-101898/1
    2023-09-12T08:24:58.411747  =

    2023-09-12T08:24:58.413298  / # /lava-101898/bin/lava-test-runner /lava=
-101898/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65001f4ef1b2f0d3688a0a78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65001f4ef1b2f0d3688a0=
a79
        failing since 41 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650021bcb5a088a6518a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650021bcb5a088a6518a0=
a46
        failing since 118 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65002201256d155d428a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65002201256d155d428a0=
a43
        failing since 230 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/650021d917ad6542b68a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650021d917ad6542b68a0=
a43
        failing since 216 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65001fed5fd48c1c8f8a0a9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65001fed5fd48c1c8f8a0=
a9f
        failing since 230 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65001ff189fcfdad158a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65001ff189fcfdad158a0=
a46
        failing since 216 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65001ff089fcfdad158a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65001ff089fcfdad158a0=
a43
        failing since 216 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65001e12610da6135b8a0ad9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001e12610da6135b8a0ae0
        failing since 48 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-12T08:14:47.710589  / # #
    2023-09-12T08:14:49.173450  export SHELL=3D/bin/sh
    2023-09-12T08:14:49.194039  #
    2023-09-12T08:14:49.194248  / # export SHELL=3D/bin/sh
    2023-09-12T08:14:51.149929  / # . /lava-1008031/environment
    2023-09-12T08:14:54.748382  /lava-1008031/bin/lava-test-runner /lava-10=
08031/1
    2023-09-12T08:14:54.769142  . /lava-1008031/environment
    2023-09-12T08:14:54.769252  / # /lava-1008031/bin/lava-test-runner /lav=
a-1008031/1
    2023-09-12T08:14:54.850523  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-12T08:14:54.851127  + cd /lava-1008031/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65001ce208b4f2d1f08a0ad6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001ce208b4f2d1f08a0adf
        failing since 47 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-12T08:14:12.511992  / # #

    2023-09-12T08:14:12.614330  export SHELL=3D/bin/sh

    2023-09-12T08:14:12.615096  #

    2023-09-12T08:14:12.716470  / # export SHELL=3D/bin/sh. /lava-11504265/=
environment

    2023-09-12T08:14:12.717283  =


    2023-09-12T08:14:12.818681  / # . /lava-11504265/environment/lava-11504=
265/bin/lava-test-runner /lava-11504265/1

    2023-09-12T08:14:12.819909  =


    2023-09-12T08:14:12.834902  / # /lava-11504265/bin/lava-test-runner /la=
va-11504265/1

    2023-09-12T08:14:12.885897  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-12T08:14:12.886406  + cd /lava-115042<8>[   20.539846] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11504265_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65001cedbb78e1fe768a0a5b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001cedbb78e1fe768a0a64
        failing since 48 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-12T08:10:15.773970  / # #

    2023-09-12T08:10:16.854043  export SHELL=3D/bin/sh

    2023-09-12T08:10:16.855788  #

    2023-09-12T08:10:18.346139  / # export SHELL=3D/bin/sh. /lava-11504270/=
environment

    2023-09-12T08:10:18.347868  =


    2023-09-12T08:10:21.068567  / # . /lava-11504270/environment/lava-11504=
270/bin/lava-test-runner /lava-11504270/1

    2023-09-12T08:10:21.070852  =


    2023-09-12T08:10:21.083542  / # /lava-11504270/bin/lava-test-runner /la=
va-11504270/1

    2023-09-12T08:10:21.142596  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-12T08:10:21.143070  + cd /lava-115042<8>[   28.617329] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11504270_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65001ee97a4122e00a8a0a78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65001ee97a4122e00a8a0=
a79
        failing since 216 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/650021b46f87c4cbe08a0a87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650021b46f87c4cbe08a0=
a88
        failing since 216 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6500219da8f6fd41dd8a0a4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6500219da8f6fd41dd8a0=
a4f
        failing since 216 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/650021b1cb2d326bea8a0a7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650021b1cb2d326bea8a0=
a7f
        failing since 216 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65001ce308b4f2d1f08a0ae1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65001ce308b4f2d1f08a0aea
        failing since 48 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-12T08:14:24.655822  / # #

    2023-09-12T08:14:24.757991  export SHELL=3D/bin/sh

    2023-09-12T08:14:24.758724  #

    2023-09-12T08:14:24.860064  / # export SHELL=3D/bin/sh. /lava-11504272/=
environment

    2023-09-12T08:14:24.860789  =


    2023-09-12T08:14:24.962206  / # . /lava-11504272/environment/lava-11504=
272/bin/lava-test-runner /lava-11504272/1

    2023-09-12T08:14:24.963347  =


    2023-09-12T08:14:24.980054  / # /lava-11504272/bin/lava-test-runner /la=
va-11504272/1

    2023-09-12T08:14:25.048175  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-12T08:14:25.048678  + cd /lava-1150427<8>[   17.058605] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11504272_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65001fb874051de1008a0abd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65001fb874051de1008a0=
abe
        failing since 98 days (last pass: next-20230601, first fail: next-2=
0230606) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/650021abcb2d326bea8a0a5e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230912/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650021abcb2d326bea8a0=
a5f
        failing since 96 days (last pass: next-20230605, first fail: next-2=
0230608) =

 =20
