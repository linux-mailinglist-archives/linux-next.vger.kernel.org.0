Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBD7518728
	for <lists+linux-next@lfdr.de>; Tue,  3 May 2022 16:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbiECOvf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 May 2022 10:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiECOvf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2022 10:51:35 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7995063EA
        for <linux-next@vger.kernel.org>; Tue,  3 May 2022 07:48:02 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id a11so14909318pff.1
        for <linux-next@vger.kernel.org>; Tue, 03 May 2022 07:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YfKJpfw0I17oHGsi9/e0jHDd+RnNSUeEzYj2a8IJ2r4=;
        b=F3MVNF5BjTBmwjXG/+s+TXbUE+pWLoQPjMA9MXNGKDkSY58qNZ2jED+1cbNwU/fspI
         ZgTyZN8g4d4kXIwA3NQvtLWiZJBiewX/N+6rB9f9IupfvrcAco8ESr0ogWnkj+FJivX6
         KiTphUFJ6sGNLyo5HUw2Sn7EJp7m0IWAiYK8+cMf7qJS41KKnuo+XyCSjA+LhJqLzqIv
         0EeqAUfr9iVNdr+X97s1DlZfysc2nd1dnuSnouiIjjmjeRn5Puao8WPglMH2NPSmDLWE
         IuBiEVDXZ79Ydl4x4Oes3gWrtE8nLG3Aci0Xo3p99Q9AN6KHcDM+4Nbna9juJnrhcbyx
         26kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YfKJpfw0I17oHGsi9/e0jHDd+RnNSUeEzYj2a8IJ2r4=;
        b=mXMMSrq4DVJYTnJ6lPT/cvWd8k4wbMTgw24tV+uRpHRBZ50iXEXnORsXhbOSJSLFnu
         PC7y5rbOLt1aoYVC1f5lcSkaUCIE7X/3OUfMQDQMNjpUewfY5AmG8FzsC8mmJpwnQ7Yb
         +j8d8ecphlfH01v7shb4clmgzRDLLc9alCa3cFmLVaNYm/OkD7rZ5iVWqws5swOVGPkm
         onNaMTp7kyYbXNjv3Hy8Q1Otn4eLX5OszFxw4Y6AxrOQOSH4i4OgjIbdPgz9NIIhTLLy
         Z5J5mRZhlPVn8j/7/jUfcz/MydYRhjGti6TiMOzjeHxeW5gVDstlkdqbES+dNOs4qoFG
         2UIw==
X-Gm-Message-State: AOAM53211fsArWVmRQ4yzTo88bzd5EVAUsP6j3T8Pun08uqI3JSZaTWj
        4BAHOttOcP7c3bnootU7mgHqa4BfsKLYiUwlV9s=
X-Google-Smtp-Source: ABdhPJzwJgXQnz0rJXykNnIvcQVpU75Nb726gTBw3tsTGMoJsg26kw0XMzP0oCrRY+3SFNi9/GyaKw==
X-Received: by 2002:a62:ea17:0:b0:50d:8d25:a17 with SMTP id t23-20020a62ea17000000b0050d8d250a17mr16441198pfh.67.1651589281697;
        Tue, 03 May 2022 07:48:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 3-20020aa79143000000b0050dc76281e6sm6392655pfi.192.2022.05.03.07.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 07:48:01 -0700 (PDT)
Message-ID: <627140a1.1c69fb81.bc545.fb14@mx.google.com>
Date:   Tue, 03 May 2022 07:48:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220503
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 15 runs, 11 regressions (next-20220503)
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

next/master baseline: 15 runs, 11 regressions (next-20220503)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | clang-13 | defconfig+a=
rm64-chromebook | 3          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220503/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220503
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      44a2f39e611ac0bc1f17c288a583d7f2e5684aa7 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62712d02893f26dc5edc7b6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62712d02893f26dc5edc7=
b6e
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62711674c4a81bf245dc7b2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62711674c4a81bf245dc7=
b2f
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62712ca0893f26dc5edc7b2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62712ca0893f26dc5edc7=
b2e
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62711624fa15e4b12fdc7b36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62711624fa15e4b12fdc7=
b37
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62712cc6a0dae2b7f7dc7b51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62712cc6a0dae2b7f7dc7=
b52
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62711626adaa238100dc7b28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62711626adaa238100dc7=
b29
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62712d3e8b50f227a3dc7b37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-qemu_arm64-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62712d3e8b50f227a3dc7=
b38
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | clang-13 | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62711675c4a81bf245dc7b40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62711675c4a81bf245dc7=
b41
        new failure (last pass: next-20220429) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | clang-13 | defconfig+a=
rm64-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/62711215b11b019277dc7b52

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220503/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62711215b11b019277dc7b9b
        failing since 5 days (last pass: next-20220422, first fail: next-20=
220427)

    2022-05-03T11:29:04.018627  <8>[   55.443469] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-05-03T11:29:05.036945  /lava-6249947/1/../bin/lava-test-case
    2022-05-03T11:29:05.050212  <8>[   56.473950] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62711215b11b019277dc7b9c
        failing since 5 days (last pass: next-20220422, first fail: next-20=
220427)

    2022-05-03T11:29:02.091527  <4>[   53.511953] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-05-03T11:29:02.988826  /lava-6249947/1/../bin/lava-test-case
    2022-05-03T11:29:03.002262  <8>[   54.425746] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62711215b11b019277dc7bb0
        failing since 5 days (last pass: next-20220422, first fail: next-20=
220427)

    2022-05-03T11:29:04.005993  /lava-6249947/1/../bin/lava-test-case   =

 =20
