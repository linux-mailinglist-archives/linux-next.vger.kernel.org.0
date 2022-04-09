Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF6A4FA9E5
	for <lists+linux-next@lfdr.de>; Sat,  9 Apr 2022 19:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbiDIRYQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 9 Apr 2022 13:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbiDIRYP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 9 Apr 2022 13:24:15 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89A5F55E8
        for <linux-next@vger.kernel.org>; Sat,  9 Apr 2022 10:22:06 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id s14so957817plk.8
        for <linux-next@vger.kernel.org>; Sat, 09 Apr 2022 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XFt61JctodJnj5h3BQ3DyF23dlj7hvCC5HLZVHeu/cg=;
        b=UUO/adcQXcR4E2K6sOEYz5Z4vrMY144HBeTOCctw3qnB/davAuq6DaJBwBdMCrqop8
         obZQXhoVBrq61xwFflpknKmcKGC6K60/L6PQevHFJyZFyaN88zICm3r7nxoLNgK8YvNx
         OTEHcMKUaMxAMtcXnN5ud6LPx7FcRLopcsjtiDnhNPqrluI0B/MUQnfq6CxxKm3fWrXP
         UKYtat72mldvldARjsy80Wc83jVNJhWLkNROUhAAyzaw384htizeiklHDSghb2DxvZXR
         0xrJLLV40W8fUGfDP6JVOlRoxvSnl1p/98obUh7N7ZAavlhtwXASP7ftWr1sth7LsxEZ
         umSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XFt61JctodJnj5h3BQ3DyF23dlj7hvCC5HLZVHeu/cg=;
        b=DXeRw1ZyqGZiXzrpK5H7mY0knFfIGgX9mAZI+p52te0E4l4WOEBzmMqyd9P/T3BveR
         Cmd/TfXesldN5A6LmTsGQXDDBMUMDUih6p8p97HBuSHwxEjjkThxJtMaAgQUORisze3j
         wNGtZq/2ATygsOxEhYJdRdULOjCeQZAZBj+4T9WAlULSexVrXGjrJBNwVE1gkDQg6nxA
         D6dNrVQfOIQIJt2hcgB7EdTeQAhSwYahM3Dd00f9Dc41Z6y0gAYdPetwgr0tJ+oMBll7
         oJgpJPxLgpRU13HPRdRR/Ualy93OzW50xT+zASMFUcXYKaJnGsBbXTbAvUX6FbzMfEny
         ASjw==
X-Gm-Message-State: AOAM5305EuI0pLRkaz2b9XHfSxwblk6XXCh6CRfIAXTfC+40NxetYHzm
        IMXKvh+S6TqjHbjoxqjWuyKIZE++pnfrXYzR
X-Google-Smtp-Source: ABdhPJxpynByN68vua4k007KLle1dW4C5WL3q0wqatdO1l1CA/tOy2eh2Buq7rsIFECT0pwo9Y45bw==
X-Received: by 2002:a17:90a:5983:b0:1c9:ee11:76df with SMTP id l3-20020a17090a598300b001c9ee1176dfmr28098314pji.95.1649524926178;
        Sat, 09 Apr 2022 10:22:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l5-20020a056a0016c500b004f768db4c94sm31174046pfc.212.2022.04.09.10.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 10:22:05 -0700 (PDT)
Message-ID: <6251c0bd.1c69fb81.fe1db.127b@mx.google.com>
Date:   Sat, 09 Apr 2022 10:22:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220408
X-Kernelci-Report-Type: test
Subject: next/master baseline: 420 runs, 10 regressions (next-20220408)
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

next/master baseline: 420 runs, 10 regressions (next-20220408)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =

hp-x360-14-G1-sona         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre  | clang-14 | defconfig =
                   | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | clang-13 | cros://chr=
ome...4-chromebook | 3          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220408/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220408
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ff511c1c68a5a35ab0b3efb3c306fd80b10d74be =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/62517c7a11d39175d5ae068d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62517c7a11d39175d5ae0=
68e
        failing since 163 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-x360-14-G1-sona         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62517d3de1819abd5fae06a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62517d3de1819abd5fae0=
6a7
        new failure (last pass: next-20220406) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/625196608af1796295ae06b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625196608af1796295ae0=
6b3
        failing since 59 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/625185e72774ea6340ae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625185e72774ea6340ae0=
687
        failing since 59 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62519663e75892d270ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62519663e75892d270ae0=
67e
        failing since 59 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62518611fa0cec5dc9ae069a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62518611fa0cec5dc9ae0=
69b
        failing since 59 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre  | clang-14 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/62518fc834a88830edae068e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220402053242+23d08=
271a4b2-1~exp1~20220402053316.109)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62518fc834a88830edae0=
68f
        new failure (last pass: next-20220405) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | clang-13 | cros://chr=
ome...4-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/62518de93c52abfc53ae067c

  Results:     71 PASS, 21 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220408/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220408/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62518de93c52abfc53ae06c2
        new failure (last pass: next-20220405)

    2022-04-09T13:44:35.431162  <8>[   37.747882] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-04-09T13:44:36.444923  /lava-6058008/1/../bin/lava-test-case
    2022-04-09T13:44:36.455359  <8>[   38.772697] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/62518dea3c52abfc53ae06c4
        new failure (last pass: next-20220405)

    2022-04-09T13:44:34.382580  /lava-6058008/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
2518dea3c52abfc53ae06c5
        new failure (last pass: next-20220405)

    2022-04-09T13:44:32.346065  <8>[   34.663136] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-driver-present RESULT=3Dpass>
    2022-04-09T13:44:33.359007  /lava-6058008/1/../bin/lava-test-case
    2022-04-09T13:44:33.368694  <8>[   35.687537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>   =

 =20
