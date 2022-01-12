Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A39348C5DD
	for <lists+linux-next@lfdr.de>; Wed, 12 Jan 2022 15:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242224AbiALOUr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Jan 2022 09:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354043AbiALOUr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jan 2022 09:20:47 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55084C061748
        for <linux-next@vger.kernel.org>; Wed, 12 Jan 2022 06:20:46 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so5070718pjp.0
        for <linux-next@vger.kernel.org>; Wed, 12 Jan 2022 06:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xs8LuExQt6eD5sAYXeIwKU+niUHv3H2dCyHiHWjmCiU=;
        b=U8WcBoMixTubXD0FffR8ShxdTjC+gdtpOnhZw+FVFLqo6w0ySLtOFw2H0d0nSmpmho
         nElgxE8b3P8fMDBoXDhf2tVPQjtJoSvEGIDZFgyR9IWlY8sZFoUYYVF5MM5CAqytOWrz
         YeyPud2+h860jLuGVrsW3ypQ/hY4uPZZkEyL1hJdWrNxEPYQoHznW7Mpk56rFRGDwx9Z
         /0UIuQEC7St9OO1nsiENOYEf7TvDjcl5hIjMqf9i348WmOMfi2j1xUBE7li3Zn5qc06j
         TKpOYmDkAj05UrdDhT7dmcfzRFYgZl3NWGEu8to796/49NrLQcFNx96EWz2DYQw4opxt
         VGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xs8LuExQt6eD5sAYXeIwKU+niUHv3H2dCyHiHWjmCiU=;
        b=KAq7XrDg7L76dVvbkqeIPXnlEAbnYTnAUB/ygwaHDd11sqW9A7OFUYiVfqsKSf/5IH
         FZsAUZ5933DxC+VtCRG00G9HWI+WfFfFm9thP6Fm/sc6UxPE1btqLbBQIT5TEIZtTGnc
         m8+0G4mvf5A4iCoqG+TKromSTjmHauQekYNE90vl0PDhUi2lS0l0VnsFgMm0jQrtcJAr
         mMWzG0wyG4ZLSynr2zIfKBHXC0JmQLc/nkGpoHrqNc581JS1/MwKdjx3kO2q4o6o9wgR
         o0yZM8XKhxtIyZAAp23wPcO0JVJNCeJgKOCvwosmDXEc/32rRWfU2pgocJCRgFiGuKiM
         TUCw==
X-Gm-Message-State: AOAM5337NCuLlUSx2nIDEJEoCpB4I1D9rRH8SXx6swjRQmu/i0k0FNve
        k2sqQ22SaCPSXHISDrVmWAis4ANf1vfCx42+
X-Google-Smtp-Source: ABdhPJym0k+bPJm7XJ/ECkdHz5G+Q8zi5Z20NtkJdqFn7EVS49xmqfAgqhIukpwsarDkNPYizQN74Q==
X-Received: by 2002:a05:6a00:98f:b0:4bb:1464:1e9a with SMTP id u15-20020a056a00098f00b004bb14641e9amr9580682pfg.61.1641997245488;
        Wed, 12 Jan 2022 06:20:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c11sm14423997pfl.134.2022.01.12.06.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 06:20:45 -0800 (PST)
Message-ID: <61dee3bd.1c69fb81.b7c0d.351a@mx.google.com>
Date:   Wed, 12 Jan 2022 06:20:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-6651-gc14f8df2f281
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 576 runs,
 19 regressions (v5.16-6651-gc14f8df2f281)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 576 runs, 19 regressions (v5.16-6651-gc14f8df2=
f281)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
ima                | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig =
                   | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig+=
ima                | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig =
                   | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 2          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-6651-gc14f8df2f281/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-6651-gc14f8df2f281
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c14f8df2f281b814871a5e7af168cecba2b5ffa6 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61de9fe99f2fca2fefef675e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61de9fe99f2fca2fefef67a3
        new failure (last pass: v5.16-rc8-185-gf94a706f394a)

    2022-01-12T09:30:25.592589  /lava-77165/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
e9fe99f2fca2fefef67a4
        new failure (last pass: v5.16-rc8-185-gf94a706f394a)

    2022-01-12T09:30:25.599164  <8>[   17.831594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-12T09:30:26.644267  /lava-77165/1/../bin/lava-test-case
    2022-01-12T09:30:26.644662  <8>[   18.850016] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61dea1b41765a01dcaef6762

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dea1b41765a01dcaef67a7
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:38:29.669726  /lava-77168/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
ea1b41765a01dcaef67a8
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:38:29.672846  <8>[   19.126633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-12T09:38:30.719912  /lava-77168/1/../bin/lava-test-case
    2022-01-12T09:38:30.720225  <8>[   20.145912] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-12T09:38:30.720397  /lava-77168/1/../bin/lava-test-case
    2022-01-12T09:38:30.720557  <8>[   20.161905] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/61dea215bfac414d5def674d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dea215bfac414d5def6792
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:40:19.822526  /lava-77175/1/../bin/lava-test-case
    2022-01-12T09:40:19.822866  <8>[   18.262111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
ea215bfac414d5def6793
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:40:20.866852  /lava-77175/1/../bin/lava-test-case
    2022-01-12T09:40:20.867262  <8>[   19.281544] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-12T09:40:20.867497  /lava-77175/1/../bin/lava-test-case
    2022-01-12T09:40:20.867716  <8>[   19.297542] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61dea513aba99d7e0aef6768

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dea513aba99d7e0aef67b7
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:53:09.886967  /lava-77180/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
ea513aba99d7e0aef67b8
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:53:09.889276  <8>[   17.412423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-12T09:53:10.935932  /lava-77180/1/../bin/lava-test-case
    2022-01-12T09:53:10.936274  <8>[   18.430704] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61dea09a9fa9787c17ef6764

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dea09a9fa9787c17ef67b0
        new failure (last pass: v5.16-rc8-185-gf94a706f394a)

    2022-01-12T09:33:53.159771  /lava-77164/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
ea09a9fa9787c17ef67b1
        new failure (last pass: v5.16-rc8-185-gf94a706f394a)

    2022-01-12T09:33:53.162861  <8>[   13.532441] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-12T09:33:54.208448  /lava-77164/1/../bin/lava-test-case
    2022-01-12T09:33:54.208850  <8>[   14.550617] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-12T09:33:54.209092  /lava-77164/1/../bin/lava-test-case
    2022-01-12T09:33:54.209316  <8>[   14.566608] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig+=
ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61dea0fe52154c7746ef6759

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dea0fe52154c7746ef67a5
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:35:33.278253  <8>[   12.425870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-01-12T09:35:34.293413  /lava-77171/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
ea0fe52154c7746ef67a6
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:35:34.296447  <8>[   13.442472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-12T09:35:35.342664  /lava-77171/1/../bin/lava-test-case
    2022-01-12T09:35:35.342956  <8>[   14.461269] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-12T09:35:35.343122  /lava-77171/1/../bin/lava-test-case
    2022-01-12T09:35:35.343259  <8>[   14.476594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-12T09:35:35.343397  /lava-77171/1/../bin/lava-test-case
    2022-01-12T09:35:35.343528  <8>[   14.492537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-12T09:35:35.343660  /lava-77171/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/61dea22a9079677034ef6750

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dea22a9079677034ef679c
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:40:51.280228  /lava-77173/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
ea22a9079677034ef679d
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:40:51.285581  <8>[   13.506635] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-12T09:40:52.329232  /lava-77173/1/../bin/lava-test-case
    2022-01-12T09:40:52.329526  <8>[   14.525304] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-12T09:40:52.329676  /lava-77173/1/../bin/lava-test-case
    2022-01-12T09:40:52.329816  <8>[   14.540599] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-12T09:40:52.329956  /lava-77173/1/../bin/lava-test-case
    2022-01-12T09:40:52.330090  <8>[   14.556603] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-12T09:40:52.330223  /lava-77173/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61dea5115a77028e7eef6749

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dea5125a77028e7eef6795
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:53:07.410619  /lava-77179/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
ea5125a77028e7eef6796
        failing since 1 day (last pass: v5.16-rc8-76-gf3c3fc1577d6, first f=
ail: v5.16-1778-g6927daa7c4fb)

    2022-01-12T09:53:07.413811  <8>[   13.460434] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-12T09:53:08.461392  /lava-77179/1/../bin/lava-test-case
    2022-01-12T09:53:08.461743  <8>[   14.479258] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61deb4d68e42496670ef6762

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-a=
311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-a=
311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61deb4d68e42496670ef6=
763
        new failure (last pass: v5.16-1778-g6927daa7c4fb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61deab8f0b99fcff47ef6745

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61deab8f0b99fcff47ef6=
746
        new failure (last pass: v5.16-1778-g6927daa7c4fb) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61deabf15a07dcff9fef678e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre=
/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-6651-=
gc14f8df2f281/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre=
/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61deabf15a07dcff9fef6=
78f
        new failure (last pass: v5.16-1778-g6927daa7c4fb) =

 =20
