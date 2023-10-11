Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858347C528A
	for <lists+linux-next@lfdr.de>; Wed, 11 Oct 2023 13:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbjJKLwp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Oct 2023 07:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234858AbjJKLwo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Oct 2023 07:52:44 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE522DE
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 04:52:36 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c871a095ceso51049695ad.2
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697025155; x=1697629955; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ScB+PupThPkohYT4w6iq2TMOuCPvYOCr5HTfjtRmhzU=;
        b=xM4m+I5DXDyvRgvy8EVDxjyYeO3ouTyUAe3Gky3HxlrjGSE4I9ADX0odm1mu0H8XTM
         2trSpgCV9PWGKmusfU0Q0KsHUrWPj0us0BmTkiKlkUY5wt0dBeizYmavTxtZVDeJYCWO
         Vi+AaNoGKaKw+EEUdYhuYPyUdvJfxrgouZdgPyGywwE2cCTw3FljOagctq8FP+nbcsmc
         C7Cb9lZGDSB14bRFP3CJ8k54wyP9ID5BJnrfRCVnFlyCLqbg2ni7LZGOEDWDtAIisWsF
         HtAm0JW2q59ooOAZCw9hjHSmLOOp4ysXWKv4b8qOLdmIauFtDxQQEoIaVTy/qXGkZ5qA
         gqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697025155; x=1697629955;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScB+PupThPkohYT4w6iq2TMOuCPvYOCr5HTfjtRmhzU=;
        b=XCJCSuOlgEypZcYsn+//04I6EdaXdO7jsqrT48835g1wd7boVwYvRktImrO0B11Ygm
         4z9M01SczNX1/6AUGLwewOd53hTqhbTdZe0AEjD+U1YLT2KKsjnrbhOkPgVQWAvDx2bs
         uWxdlzqXa8rS36LQ298wgVRGwXKZA3Rap8gSaqRtnIwbV0JG21NiBMLp1Z9XljZIOuED
         zA4CRQlnHNxhgdQGSL5LIQkr65oTWWjl5teJ0wE80X97EEmDWCrMF8CaSNbzfFzCg8f5
         vge9js7HVmsHZuUtGOHvIPNl9usvQGDWWfspKKxoAX9sxHdf5GB5PXS36g+mDWU6zkhq
         0eag==
X-Gm-Message-State: AOJu0Ywm3gZeE4gZwQKlvisptKMRmKxaFNHwztsDL74le+rTzlvgTKqp
        nlX7kVzjPCLicuqqM3ka9P++O4reCFJCEJIABKh9Bg==
X-Google-Smtp-Source: AGHT+IEcxWDOscFT+RLnoc1vlIIj7XfAYL/TOP9FiN8ioGHYJDu6jnOe4ddJBC/qXEi7lIUJjDYMcA==
X-Received: by 2002:a17:902:e80f:b0:1c4:152a:496c with SMTP id u15-20020a170902e80f00b001c4152a496cmr21810664plg.19.1697025154447;
        Wed, 11 Oct 2023 04:52:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902b94300b001c5c370d4desm13718352pls.246.2023.10.11.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:52:32 -0700 (PDT)
Message-ID: <65268c80.170a0220.2e8b.5d0a@mx.google.com>
Date:   Wed, 11 Oct 2023 04:52:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231011
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 249 runs, 56 regressions (next-20231011)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 249 runs, 56 regressions (next-20231011)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_i386                    | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =

qemu_i386                    | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =

qemu_mips-malta              | mips   | lab-baylibre  | gcc-10   | malta_de=
fconfig              | 1          =

qemu_riscv64                 | riscv  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =

qemu_riscv64                 | riscv  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =

rk3588-rock-5b               | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231011/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231011
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2933a1156742d8c47550493a77af8e2d81cf3c84 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/652654f7b98f3ff228efcefd

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652654f7b98f3ff228efcf12
        failing since 42 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-11T07:55:09.259557  + <8>[   10.268104] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11737817_1.4.2.3.1>

    2023-10-11T07:55:09.260089  set +x

    2023-10-11T07:55:09.367445  / # #

    2023-10-11T07:55:09.469718  export SHELL=3D/bin/sh

    2023-10-11T07:55:09.470501  #

    2023-10-11T07:55:09.572073  / # export SHELL=3D/bin/sh. /lava-11737817/=
environment

    2023-10-11T07:55:09.572876  =


    2023-10-11T07:55:09.674689  / # . /lava-11737817/environment/lava-11737=
817/bin/lava-test-runner /lava-11737817/1

    2023-10-11T07:55:09.676255  =


    2023-10-11T07:55:09.678444  / # /lava-11737817/bin/lava-test-runner /la=
va-11737817/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6526553dcdef00f661efcf3a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6526553dcdef00f661efcf4f
        failing since 42 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-11T07:57:51.345682  + <8>[   10.337642] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11737851_1.4.2.3.1>

    2023-10-11T07:57:51.345765  set +x

    2023-10-11T07:57:51.450436  / # #

    2023-10-11T07:57:51.551034  export SHELL=3D/bin/sh

    2023-10-11T07:57:51.551211  #

    2023-10-11T07:57:51.651761  / # export SHELL=3D/bin/sh. /lava-11737851/=
environment

    2023-10-11T07:57:51.651932  =


    2023-10-11T07:57:51.752399  / # . /lava-11737851/environment/lava-11737=
851/bin/lava-test-runner /lava-11737851/1

    2023-10-11T07:57:51.752653  =


    2023-10-11T07:57:51.757187  / # /lava-11737851/bin/lava-test-runner /la=
va-11737851/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65265e55e66f2458f3efcef4

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65265e55e66f2458f3efcf09
        failing since 43 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-11T08:35:14.818557  + <8>[   10.604676] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11737780_1.4.2.3.1>

    2023-10-11T08:35:14.819146  set +x

    2023-10-11T08:35:14.926548  / # #

    2023-10-11T08:35:15.028948  export SHELL=3D/bin/sh

    2023-10-11T08:35:15.029721  #

    2023-10-11T08:35:15.131242  / # export SHELL=3D/bin/sh. /lava-11737780/=
environment

    2023-10-11T08:35:15.132008  =


    2023-10-11T08:35:15.233945  / # . /lava-11737780/environment/lava-11737=
780/bin/lava-test-runner /lava-11737780/1

    2023-10-11T08:35:15.235204  =


    2023-10-11T08:35:15.240618  / # /lava-11737780/bin/lava-test-runner /la=
va-11737780/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264b054e9c0a5f28efcfa0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264b054e9c0a5f28efcfa9
        failing since 8 days (last pass: next-20230717, first fail: next-20=
231003)

    2023-10-11T07:12:37.217193  / # #
    2023-10-11T07:12:38.371387  export SHELL=3D/bin/sh
    2023-10-11T07:12:38.376949  #
    2023-10-11T07:12:39.916802  / # export SHELL=3D/bin/sh. /lava-3801172/e=
nvironment
    2023-10-11T07:12:39.922255  =

    2023-10-11T07:12:42.730398  / # . /lava-3801172/environment/lava-380117=
2/bin/lava-test-runner /lava-3801172/1
    2023-10-11T07:12:42.736333  =

    2023-10-11T07:12:42.736565  / # /lava-3801172/bin/lava-t<3>[   23.94862=
4] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistan=
ce
    2023-10-11T07:12:42.753782  est-runner /lava-3801172/1
    2023-10-11T07:12:42.769999  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264b7deaa24e490defcfc6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264b7deaa24e490defcfcf
        failing since 8 days (last pass: next-20230707, first fail: next-20=
231003)

    2023-10-11T07:14:50.780191  / # #
    2023-10-11T07:14:51.934161  export SHELL=3D/bin/sh
    2023-10-11T07:14:51.939558  #
    2023-10-11T07:14:53.479062  / # export SHELL=3D/bin/sh. /lava-3801200/e=
nvironment
    2023-10-11T07:14:53.484454  =

    2023-10-11T07:14:56.291944  / # . /lava-3801200/environment/lava-380120=
0/bin/lava-test-runner /lava-3801200/1
    2023-10-11T07:14:56.297592  =

    2023-10-11T07:14:56.297814  / # /lava-3801200/bin/lava-<3>[   24.204560=
] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-11T07:14:56.306527  test-runner /lava-3801200/1
    2023-10-11T07:14:56.370256  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264b3a3c55d1fac0efcf17

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264b3a3c55d1fac0efcf20
        failing since 56 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-11T07:13:38.809464  + set<8>[   28.028551] <LAVA_SIGNAL_ENDRUN =
0_dmesg 163993_1.5.2.4.1>
    2023-10-11T07:13:38.810050   +x
    2023-10-11T07:13:38.927431  / # #
    2023-10-11T07:13:40.093262  export SHELL=3D/bin/sh
    2023-10-11T07:13:40.099374  #
    2023-10-11T07:13:41.598380  / # export SHELL=3D/bin/sh. /lava-163993/en=
vironment
    2023-10-11T07:13:41.604489  =

    2023-10-11T07:13:44.325760  / # . /lava-163993/environment/lava-163993/=
bin/lava-test-runner /lava-163993/1
    2023-10-11T07:13:44.333263  =

    2023-10-11T07:13:44.341103  / # /lava-163993/bin/lava-test-runner /lava=
-163993/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264bc7e69cbcb78aefcf53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264bc7e69cbcb78aefcf5b
        failing since 56 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-11T07:16:00.086129  + set<8>[   28.217558] <LAVA_SIGNAL_ENDRUN =
0_dmesg 164009_1.5.2.4.1>
    2023-10-11T07:16:00.086715   +x
    2023-10-11T07:16:00.192819  / # #
    2023-10-11T07:16:01.358758  export SHELL=3D/bin/sh
    2023-10-11T07:16:01.364915  #
    2023-10-11T07:16:02.861966  / # export SHELL=3D/bin/sh. /lava-164009/en=
vironment
    2023-10-11T07:16:02.867992  =

    2023-10-11T07:16:05.588634  / # . /lava-164009/environment/lava-164009/=
bin/lava-test-runner /lava-164009/1
    2023-10-11T07:16:05.595140  =

    2023-10-11T07:16:05.600800  / # /lava-164009/bin/lava-test-runner /lava=
-164009/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6526544518871a8893efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526544518871a8893efc=
ef4
        failing since 245 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264fb9609e3a0ad2efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264fb9609e3a0ad2efc=
ef4
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264a3d9600f39430efcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264a3d9600f39430efc=
ef8
        failing since 12 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65265343e2a48c1a44efcf04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65265343e2a48c1a44efc=
f05
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264fb7edee7fa6e6efcf12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264fb7edee7fa6e6efc=
f13
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264a3ed05020b145efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264a3ed05020b145efc=
ef4
        failing since 12 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65265344c137941b55efcf0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65265344c137941b55efc=
f0e
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264fb83ddef650b2efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264fb83ddef650b2efc=
ef4
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264a3f34b1df298befcefa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264a3f34b1df298befc=
efb
        failing since 12 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/652653464ec8cb6556efcef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652653464ec8cb6556efc=
ef9
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264fb61cd19f9a5befcefb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264fb61cd19f9a5befc=
efc
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264a40f62eea3a83efcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264a40f62eea3a83efc=
ef5
        failing since 12 days (last pass: next-20230719, first fail: next-2=
0230929) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/652653454ec8cb6556efcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652653454ec8cb6556efc=
ef5
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264aa298e6ae31f4efcf0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264aa298e6ae31f4efc=
f0b
        failing since 8 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264acb4a5d40bea1efcf05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264acb4a5d40bea1efc=
f06
        failing since 8 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/652655573fdbc9dcd4efcf2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652655573fdbc9dcd4efc=
f2c
        failing since 1 day (last pass: next-20230720, first fail: next-202=
31010) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264aa39600f39430efcf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264aa39600f39430efc=
f11
        failing since 8 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264ac9d05020b145efcf0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264ac9d05020b145efc=
f0c
        failing since 8 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6526555a3fdbc9dcd4efcf2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526555a3fdbc9dcd4efc=
f30
        failing since 1 day (last pass: next-20230720, first fail: next-202=
31010) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264aa19600f39430efcf0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264aa19600f39430efc=
f0e
        failing since 8 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264acc34b1df298befcf1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264acc34b1df298befc=
f1f
        failing since 8 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65265559a05028f586efcf21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65265559a05028f586efc=
f22
        failing since 1 day (last pass: next-20230720, first fail: next-202=
31010) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264aa498e6ae31f4efcf0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264aa498e6ae31f4efc=
f0e
        failing since 8 days (last pass: next-20230717, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264aca34b1df298befcf0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264aca34b1df298befc=
f10
        failing since 8 days (last pass: next-20230710, first fail: next-20=
231003) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65265558165b8733aeefcf1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65265558165b8733aeefc=
f1c
        failing since 1 day (last pass: next-20230720, first fail: next-202=
31010) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386                    | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/6526485d2b3d4f55d9efcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526485d2b3d4f55d9efc=
ef5
        failing since 12 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386                    | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/65265133896de41125efcefd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65265133896de41125efc=
efe
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/6526485c50c6888825efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526485c50c6888825efc=
ef4
        failing since 12 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre  | gcc-10   | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/65265134896de41125efcf00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65265134896de41125efc=
f01
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-baylibre  | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65264fa3edee7fa6e6efcf02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/mips=
/malta_defconfig/gcc-10/lab-baylibre/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/mips=
/malta_defconfig/gcc-10/lab-baylibre/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264fa3edee7fa6e6efc=
f03
        failing since 12 days (last pass: next-20230719, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_riscv64                 | riscv  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65264c23ef03810cebefcf05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264c23ef03810cebefc=
f06
        failing since 12 days (last pass: next-20230718, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_riscv64                 | riscv  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/652654a33197d3d0dcefcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652654a33197d3d0dcefc=
ef6
        failing since 12 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_smp8_riscv64            | riscv  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65264c2247c5d09570efcf03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65264c2247c5d09570efc=
f04
        failing since 12 days (last pass: next-20230718, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_smp8_riscv64            | riscv  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/652654a418871a8893efcf1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652654a418871a8893efc=
f1b
        failing since 12 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/652647f89332fe5824efcefb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652647f89332fe5824efc=
efc
        failing since 12 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6526548f18871a8893efcf14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526548f18871a8893efc=
f15
        failing since 12 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/652654a61b51d1dbc4efcf15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652654a61b51d1dbc4efc=
f16
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/652647f906753c6f22efcefe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652647f906753c6f22efc=
eff
        failing since 12 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/652654911b51d1dbc4efcf03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652654911b51d1dbc4efc=
f04
        failing since 12 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/652654a71b51d1dbc4efcf18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652654a71b51d1dbc4efc=
f19
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | clang-17 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/652647fa06753c6f22efcf01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652647fa06753c6f22efc=
f02
        failing since 12 days (last pass: next-20230721, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/652654901b51d1dbc4efceff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652654901b51d1dbc4efc=
f00
        failing since 12 days (last pass: next-20230724, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/652654a5658690b8b3efcef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652654a5658690b8b3efc=
ef9
        failing since 12 days (last pass: next-20230720, first fail: next-2=
0230928) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264df8205f081510efcef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264df8205f081510efcefe
        failing since 64 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-10-11T07:25:23.830751  + set +x
    2023-10-11T07:25:23.833859  <8>[   28.163334] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1019578_1.5.2.4.1>
    2023-10-11T07:25:23.943341  / # #
    2023-10-11T07:25:25.407812  export SHELL=3D/bin/sh
    2023-10-11T07:25:25.428765  #
    2023-10-11T07:25:25.429219  / # export SHELL=3D/bin/sh
    2023-10-11T07:25:27.386724  / # . /lava-1019578/environment
    2023-10-11T07:25:30.985987  /lava-1019578/bin/lava-test-runner /lava-10=
19578/1
    2023-10-11T07:25:31.007683  . /lava-1019578/environment
    2023-10-11T07:25:31.008127  / # /lava-1019578/bin/lava-test-runner /lav=
a-1019578/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3588-rock-5b               | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264b32c6e50da12defcf3f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3588-rock-5b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3588-rock-5b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264b32c6e50da12defcf48
        new failure (last pass: next-20231010)

    2023-10-11T07:16:01.937362  / # #

    2023-10-11T07:16:02.039493  export SHELL=3D/bin/sh

    2023-10-11T07:16:02.040181  #

    2023-10-11T07:16:02.141598  / # export SHELL=3D/bin/sh. /lava-11737323/=
environment

    2023-10-11T07:16:02.142243  =


    2023-10-11T07:16:02.243661  / # . /lava-11737323/environment/lava-11737=
323/bin/lava-test-runner /lava-11737323/1

    2023-10-11T07:16:02.244750  =


    2023-10-11T07:16:02.245824  / # /lava-11737323/bin/lava-test-runner /la=
va-11737323/1

    2023-10-11T07:16:02.302087  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-11T07:16:02.302566  + cd /lava-11737323/1/tests/1_bootrr
 =

    ... (33 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264af8807918a53cefcf07

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264af8807918a53cefcf10
        failing since 0 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20231010)

    2023-10-11T07:12:50.353404  <8>[   18.703358] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438017_1.5.2.4.1>
    2023-10-11T07:12:50.458455  / # #
    2023-10-11T07:12:50.560049  export SHELL=3D/bin/sh
    2023-10-11T07:12:50.560699  #
    2023-10-11T07:12:50.661693  / # export SHELL=3D/bin/sh. /lava-438017/en=
vironment
    2023-10-11T07:12:50.662264  =

    2023-10-11T07:12:50.763304  / # . /lava-438017/environment/lava-438017/=
bin/lava-test-runner /lava-438017/1
    2023-10-11T07:12:50.764191  =

    2023-10-11T07:12:50.768784  / # /lava-438017/bin/lava-test-runner /lava=
-438017/1
    2023-10-11T07:12:50.841794  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264b5ccee0f5a4f6efcf00

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264b5ccee0f5a4f6efcf09
        failing since 0 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20231010)

    2023-10-11T07:14:32.107423  / # #
    2023-10-11T07:14:32.209474  export SHELL=3D/bin/sh
    2023-10-11T07:14:32.210114  #
    2023-10-11T07:14:32.311123  / # export SHELL=3D/bin/sh. /lava-438018/en=
vironment
    2023-10-11T07:14:32.311769  =

    2023-10-11T07:14:32.412835  / # . /lava-438018/environment/lava-438018/=
bin/lava-test-runner /lava-438018/1
    2023-10-11T07:14:32.413849  =

    2023-10-11T07:14:32.416242  / # /lava-438018/bin/lava-test-runner /lava=
-438018/1
    2023-10-11T07:14:32.495689  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-11T07:14:32.496057  + cd /lava-438018/<8>[   19.205917] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 438018_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65264af74e9c0a5f28efcf17

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264af74e9c0a5f28efcf20
        failing since 0 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20231010)

    2023-10-11T07:16:54.705224  / # #

    2023-10-11T07:16:54.805715  export SHELL=3D/bin/sh

    2023-10-11T07:16:54.805837  #

    2023-10-11T07:16:54.906324  / # export SHELL=3D/bin/sh. /lava-11737313/=
environment

    2023-10-11T07:16:54.906440  =


    2023-10-11T07:16:55.007086  / # . /lava-11737313/environment/lava-11737=
313/bin/lava-test-runner /lava-11737313/1

    2023-10-11T07:16:55.008195  =


    2023-10-11T07:16:55.019795  / # /lava-11737313/bin/lava-test-runner /la=
va-11737313/1

    2023-10-11T07:16:55.091386  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-11T07:16:55.091883  + cd /lava-11737313/1/tests/1_boot<8>[   17=
.058107] <LAVA_SIGNAL_STARTRUN 1_bootrr 11737313_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65264b0bd9966477c5efcef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231011/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65264b0bd9966477c5efcefc
        failing since 0 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20231010)

    2023-10-11T07:17:26.246557  / # #

    2023-10-11T07:17:26.348710  export SHELL=3D/bin/sh

    2023-10-11T07:17:26.349393  #

    2023-10-11T07:17:26.450841  / # export SHELL=3D/bin/sh. /lava-11737321/=
environment

    2023-10-11T07:17:26.451536  =


    2023-10-11T07:17:26.553006  / # . /lava-11737321/environment/lava-11737=
321/bin/lava-test-runner /lava-11737321/1

    2023-10-11T07:17:26.554070  =


    2023-10-11T07:17:26.570778  / # /lava-11737321/bin/lava-test-runner /la=
va-11737321/1

    2023-10-11T07:17:26.637704  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-11T07:17:26.638197  + cd /lava-1173732<8>[   17.138637] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11737321_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
