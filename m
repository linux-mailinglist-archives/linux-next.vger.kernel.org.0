Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B08079E4F3
	for <lists+linux-next@lfdr.de>; Wed, 13 Sep 2023 12:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjIMKby (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Sep 2023 06:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjIMKbx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Sep 2023 06:31:53 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0DCD3
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 03:31:49 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c39bc0439bso6086555ad.0
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694601108; x=1695205908; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rufXb1j5STDKTi7p2ZaewmUBu164nLZBa4dcQpy983s=;
        b=bs3fJzPPeMGZhZQIVge31VHTfW8/74EeZkBcaRb1WM0ru28qp09VLJ0YDPgU94vAQI
         YqLNn/p3z02ElraP4AP8BYoxWS4mZSLJC7Tx+Yy6JwhNnx3rE78vqxy1vUQ5Lj/seRhk
         V8g5bRrx2cDPrvR8yqr94FEbByB47qk5cuTTnkphFtOnYZ1RNywKsMTdc09J0DY8irnY
         0N/gqyQAjccLWlbCWhxdusASkGcdAJRgrujDeWkezgtlyoTcgfjihB8P1/Tvc8L9wO3E
         tidag4OL00dCANe5zVOkGK24kA5rmpDtGx2ZVjYQ2xpyHCrMGJq5QeLhtDeRRP45jNpb
         N62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694601108; x=1695205908;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rufXb1j5STDKTi7p2ZaewmUBu164nLZBa4dcQpy983s=;
        b=ECImpEo8BQ26YDvNKZH0Pz/RxrYBTvRsw3QZNLiy6zIdO2Pzi1guRqblQ1/DU9RNQ9
         tYv7s+95nDb/lkJY6dC/sYQ+vVm5Kgyfete7ZGr1oPBv95L3FKyobMefoNf41P209r4D
         rajPm1x5R1hOJuyprJrL9IrGUxco3f5H/kfvRbbyhLk5vFxF++JQW7Fr3ZiwY556E+bg
         Bimw1bS/qk2RTWFa9+iyFM5dDQzwUT9qBCGSvk8gQ1bT8M7Sc5MdUN1uaFejdEijBuj2
         bZhOPhOT9SpqX1/o8JaFoLPoL4PwFxuifGCBrtU4vBiF7E1PmhDJoZMnU8YL1FPwTCg/
         oDmQ==
X-Gm-Message-State: AOJu0Yy/JMzu4O2/sq67muj8VZ3PuXubGy3OxPU52XcPdQcFbJ5Y4Qnz
        MVsTg+4G8R7vDUqOA8Ko59s9b/M0YX6EhAJ4pIA=
X-Google-Smtp-Source: AGHT+IEs56EDpFBkx8rorA0byTqlxDf/4vBMuobnWYC4gKVoAXGuuHw87CyUGZBSlx443vSe+sHHTw==
X-Received: by 2002:a17:903:22c3:b0:1c3:a814:a12b with SMTP id y3-20020a17090322c300b001c3a814a12bmr3393635plg.16.1694601107109;
        Wed, 13 Sep 2023 03:31:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902eb0c00b001b672af624esm10102070plb.164.2023.09.13.03.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 03:31:46 -0700 (PDT)
Message-ID: <65018f92.170a0220.f1b7c.cd0e@mx.google.com>
Date:   Wed, 13 Sep 2023 03:31:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230913
X-Kernelci-Report-Type: test
Subject: next/master baseline: 309 runs, 76 regressions (next-20230913)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 309 runs, 76 regressions (next-20230913)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10     | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10     | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10     | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 1          =

qemu_i386                    | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =

qemu_mips-malta              | mips   | lab-broonie   | gcc-10     | malta_=
defconfig              | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10     | malta_=
defconfig              | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10     | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10     | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10     | defcon=
fig+kselftest          | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230913/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230913
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e143016b56ecb0fcda5bb6026b0a25fe55274f56 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6501530eb54ba2d8c48a0a43

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6501530eb54ba2d8c48a0a58
        failing since 14 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-13T06:13:15.082248  + <8>[   11.004729] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11512722_1.4.2.3.1>

    2023-09-13T06:13:15.082867  set +x

    2023-09-13T06:13:15.190824  / # #

    2023-09-13T06:13:15.293221  export SHELL=3D/bin/sh

    2023-09-13T06:13:15.294023  #

    2023-09-13T06:13:15.395582  / # export SHELL=3D/bin/sh. /lava-11512722/=
environment

    2023-09-13T06:13:15.396439  =


    2023-09-13T06:13:15.498184  / # . /lava-11512722/environment/lava-11512=
722/bin/lava-test-runner /lava-11512722/1

    2023-09-13T06:13:15.499887  =


    2023-09-13T06:13:15.504404  / # /lava-11512722/bin/lava-test-runner /la=
va-11512722/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650156bcd88e10999d8a0a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650156bcd88e10999d8a0=
a4e
        failing since 119 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650156c7d88e10999d8a0a62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650156c7d88e10999d8a0=
a63
        failing since 119 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6501530004a1292e498a0a4a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6501530004a1292e498a0a5f
        failing since 14 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-13T06:13:04.790882  <8>[   10.302357] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-09-13T06:13:04.797535  + <8>[   10.311304] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11512707_1.4.2.3.1>

    2023-09-13T06:13:04.797645  set +x

    2023-09-13T06:13:04.901282  / # #

    2023-09-13T06:13:05.001916  export SHELL=3D/bin/sh

    2023-09-13T06:13:05.002112  #

    2023-09-13T06:13:05.102670  / # export SHELL=3D/bin/sh. /lava-11512707/=
environment

    2023-09-13T06:13:05.102899  =


    2023-09-13T06:13:05.203459  / # . /lava-11512707/environment/lava-11512=
707/bin/lava-test-runner /lava-11512707/1

    2023-09-13T06:13:05.203798  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650156a3cd7c7839f48a0a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650156a3cd7c7839f48a0=
a4a
        failing since 119 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650153022acd70fca38a0a81

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650153022acd70fca38a0a96
        failing since 14 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-13T06:13:09.714500  + <8>[    8.364239] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11512686_1.4.2.3.1>

    2023-09-13T06:13:09.714644  set +x

    2023-09-13T06:13:09.819113  / # #

    2023-09-13T06:13:09.919633  export SHELL=3D/bin/sh

    2023-09-13T06:13:09.919791  #

    2023-09-13T06:13:10.020264  / # export SHELL=3D/bin/sh. /lava-11512686/=
environment

    2023-09-13T06:13:10.020451  =


    2023-09-13T06:13:10.121007  / # . /lava-11512686/environment/lava-11512=
686/bin/lava-test-runner /lava-11512686/1

    2023-09-13T06:13:10.121249  =


    2023-09-13T06:13:10.125520  / # /lava-11512686/bin/lava-test-runner /la=
va-11512686/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650156a5e38909602e8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650156a5e38909602e8a0=
a43
        failing since 119 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650156b748cf1f6dc78a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650156b748cf1f6dc78a0=
a45
        failing since 119 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6501538eb3067318b58a0a4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6501538eb3067318b58a0a58
        failing since 28 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-13T06:15:24.098985  + set<8>[   28.520482] <LAVA_SIGNAL_ENDRUN =
0_dmesg 104238_1.5.2.4.1>
    2023-09-13T06:15:24.099408   +x
    2023-09-13T06:15:24.209091  / # #
    2023-09-13T06:15:25.375040  export SHELL=3D/bin/sh
    2023-09-13T06:15:25.381167  #
    2023-09-13T06:15:26.880377  / # export SHELL=3D/bin/sh. /lava-104238/en=
vironment
    2023-09-13T06:15:26.886416  =

    2023-09-13T06:15:29.609670  / # . /lava-104238/environment/lava-104238/=
bin/lava-test-runner /lava-104238/1
    2023-09-13T06:15:29.616396  =

    2023-09-13T06:15:29.619011  / # /lava-104238/bin/lava-test-runner /lava=
-104238/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6501541a1a61b29b198a0a6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6501541a1a61b29b198a0a75
        failing since 28 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-13T06:17:41.520862  + set<8>[   27.173751] <LAVA_SIGNAL_ENDRUN =
0_dmesg 104281_1.5.2.4.1>
    2023-09-13T06:17:41.524180   +x
    2023-09-13T06:17:41.630236  / # #
    2023-09-13T06:17:42.796235  export SHELL=3D/bin/sh
    2023-09-13T06:17:42.802432  #
    2023-09-13T06:17:44.301145  / # export SHELL=3D/bin/sh. /lava-104281/en=
vironment
    2023-09-13T06:17:44.307185  =

    2023-09-13T06:17:47.030545  / # . /lava-104281/environment/lava-104281/=
bin/lava-test-runner /lava-104281/1
    2023-09-13T06:17:47.037310  =

    2023-09-13T06:17:47.040935  / # /lava-104281/bin/lava-test-runner /lava=
-104281/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65015943db5e6e104c8a0aef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65015943db5e6e104c8a0af8
        failing since 28 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-13T06:39:35.625692  + set<8>[   27.291786] <LAVA_SIGNAL_ENDRUN =
0_dmesg 104333_1.5.2.4.1>
    2023-09-13T06:39:35.626260   +x
    2023-09-13T06:39:35.736566  / # #
    2023-09-13T06:39:36.899567  export SHELL=3D/bin/sh
    2023-09-13T06:39:36.905864  #
    2023-09-13T06:39:38.399746  / # export SHELL=3D/bin/sh. /lava-104333/en=
vironment
    2023-09-13T06:39:38.405674  =

    2023-09-13T06:39:41.120184  / # . /lava-104333/environment/lava-104333/=
bin/lava-test-runner /lava-104333/1
    2023-09-13T06:39:41.126319  =

    2023-09-13T06:39:41.129347  / # /lava-104333/bin/lava-test-runner /lava=
-104333/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/650156b2e38909602e8a0a5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650156b2e38909602e8a0=
a5e
        failing since 119 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65015da21c3c015ff18a0a55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015da21c3c015ff18a0=
a56
        failing since 231 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65015d4eb41bf8648a8a0a62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015d4eb41bf8648a8a0=
a63
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65015d5bb41bf8648a8a0b11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015d5bb41bf8648a8a0=
b12
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65015871a6b8739ef88a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015871a6b8739ef88a0=
a43
        failing since 231 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6501587f283c764d188a0a64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501587f283c764d188a0=
a65
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6501588cd4f4e887b28a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501588cd4f4e887b28a0=
a43
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65015a6eaf6a4195b88a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015a6eaf6a4195b88a0=
a5d
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/650153ba9508400dc68a0a71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650153ba9508400dc68a0=
a72
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65015370b9d42d1ea68a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015370b9d42d1ea68a0=
a45
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6501553742d64b66248a0a61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501553742d64b66248a0=
a62
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6501555d1d54a109ef8a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501555d1d54a109ef8a0=
a54
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6501551556730f726d8a0a98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501551556730f726d8a0=
a99
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6501552a42d64b66248a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501552a42d64b66248a0=
a54
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/650153a7804df172cf8a0a48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650153a7804df172cf8a0=
a49
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65015371b3067318b58a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015371b3067318b58a0=
a43
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6501552242d64b66248a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501552242d64b66248a0=
a43
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6501554a42d64b66248a0a70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501554a42d64b66248a0=
a71
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6501551456730f726d8a0a92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501551456730f726d8a0=
a93
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65015515317d2ee1f28a0aa0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015515317d2ee1f28a0=
aa1
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-broonie   | gcc-10     | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/650157ba31de24c0f98a0a8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650157ba31de24c0f98a0=
a8e
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10     | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6501575826dc3be19c8a105b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501575826dc3be19c8a1=
05c
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501532ec90f22118a8a0a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501532ec90f22118a8a0=
a70
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650152f82acd70fca38a0a79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650152f82acd70fca38a0=
a7a
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650153a6804df172cf8a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650153a6804df172cf8a0=
a44
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650154e5a1029b8a908a0acf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650154e5a1029b8a908a0=
ad0
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65015842a1a3ff5c328a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015842a1a3ff5c328a0=
a50
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650153488fc183a7b18a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650153488fc183a7b18a0=
a45
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650154b0541fd02c6d8a0ac3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650154b0541fd02c6d8a0=
ac4
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6501576c26dc3be19c8a1061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501576c26dc3be19c8a1=
062
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501546ec8c5b28fe68a0ada

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501546ec8c5b28fe68a0=
adb
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/65015920db5e6e104c8a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015920db5e6e104c8a0=
a46
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501543a1a61b29b198a0a94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501543a1a61b29b198a0=
a95
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/650158c40d13d213498a0a4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650158c40d13d213498a0=
a4f
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65015342ac25e62f298a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015342ac25e62f298a0=
a48
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501530d9c7e5187648a0a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501530d9c7e5187648a0=
a4a
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65015356ac25e62f298a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015356ac25e62f298a0=
a54
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650154e6a1029b8a908a0ad2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650154e6a1029b8a908a0=
ad3
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/650158a80d13d213498a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650158a80d13d213498a0=
a43
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65015334c90f22118a8a0a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015334c90f22118a8a0=
a76
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650154b1541fd02c6d8a0ac6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650154b1541fd02c6d8a0=
ac7
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6501576e31b6827bef8a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501576e31b6827bef8a0=
a46
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501546d52f290b3f58a0aea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501546d52f290b3f58a0=
aeb
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/650159abbb79bbe0af8a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650159abbb79bbe0af8a0=
a51
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650154381a61b29b198a0a8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650154381a61b29b198a0=
a8f
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/650158c10d13d213498a0a48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650158c10d13d213498a0=
a49
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501532faed323176c8a0a96

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501532faed323176c8a0=
a97
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501530ce901af0a938a0a93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501530ce901af0a938a0=
a94
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65015355ac25e62f298a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015355ac25e62f298a0=
a51
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650154d2541fd02c6d8a0e0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650154d2541fd02c6d8a0=
e0b
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/650158a7d4f4e887b28a0a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650158a7d4f4e887b28a0=
a4e
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65015335aed323176c8a0aaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015335aed323176c8a0=
aab
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/650154b1541fd02c6d8a0ac9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650154b1541fd02c6d8a0=
aca
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6501576e26dc3be19c8a1067

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501576e26dc3be19c8a1=
068
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501545a52f290b3f58a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501545a52f290b3f58a0=
a5d
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/6501591fdb5e6e104c8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501591fdb5e6e104c8a0=
a43
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6501543963137d618e8a0a6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501543963137d618e8a0=
a6b
        new failure (last pass: next-20230911) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/650158c3d4f4e887b28a0a55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/650158c3d4f4e887b28a0=
a56
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6501577b26dc3be19c8a106e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6501577b26dc3be19c8a1=
06f
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65015aed44ce6dbc318a0acf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015aed44ce6dbc318a0=
ad0
        new failure (last pass: next-20230912) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65015d2ab41bf8648a8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015d2ab41bf8648a8a0=
a43
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65015d1f8882700f028a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015d1f8882700f028a0=
a44
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65015d6ffbf2ee15668a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015d6ffbf2ee15668a0=
a44
        failing since 217 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10     | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65015850a1a3ff5c328a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015850a1a3ff5c328a0=
a54
        failing since 99 days (last pass: next-20230601, first fail: next-2=
0230606) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65015d288882700f028a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230913/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65015d288882700f028a0=
a50
        failing since 97 days (last pass: next-20230605, first fail: next-2=
0230608) =

 =20
