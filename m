Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7185C7926B2
	for <lists+linux-next@lfdr.de>; Tue,  5 Sep 2023 18:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236137AbjIEQDK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Sep 2023 12:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353725AbjIEHen (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Sep 2023 03:34:43 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2184518C
        for <linux-next@vger.kernel.org>; Tue,  5 Sep 2023 00:34:38 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68bed8de5b9so1284716b3a.3
        for <linux-next@vger.kernel.org>; Tue, 05 Sep 2023 00:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1693899277; x=1694504077; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vkInM08iwIj7MFUZkUUlo9htdb+mO5VgLr8J6e2vzJY=;
        b=VfJ0Ru5XxTKQyuU0fRNtMf5C1/T2GgyXkLtgoptU0gI86Dpc9Ct8jWtVHgnwYrsrgf
         rtgb4gmSb77Bvw23lvnnXKd2/xxrRQk6hVfLYgFaWDwvM6iD+Lmn3LwzYsg5PIti8Jhp
         fEnlBWIUpqGzAOo8ZSXV4AgGu458/Rn+EmWmcah9RUMlY3Pr0WYJGdZOynyA2FTxxH6J
         T7iIkNbz4QslBWoo4yvqDuz1E9CEOzo5JWovy3I25g2CbjQqr4Aq/IBEnNQJD+j+1bWd
         65KIv4B9klXTKpYzZaa3RTA34oqge8FlstcxTB0DlJMfaxbVuJrN9eU1D4EyGNUnbH2t
         itiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693899277; x=1694504077;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkInM08iwIj7MFUZkUUlo9htdb+mO5VgLr8J6e2vzJY=;
        b=Kr9QRULXgEC53pF2UDG9zPT6APH0gziBQlo1LfGIesj7f+ziZIjxKm7QuSsjPUuGUt
         S+Bfgjg7ruMMYM8YxWPkF09UxIC920bJdZ1xYxc7gniMb8JQ39KZdQwgBpFnSyDRQT9b
         CO4PRWg1EFgtjPDDyPxaSDPF2MkVK4g+7GQBf4+7LP7k6yAlM4RUfFXxzJnr0LYOCIPo
         WnbJazM1mpnysMAMCAsgb6FKkiYpUSBkiu7sy/DfRuWs9CJJjsQmq9Vd+H2mkvyigXNx
         sv0EOJtjLRk/iCyHyFSO6WO0bBwmcaqHJRtwaSGUL8B5tDvTzb8G1/Lk09qcxi6wT6sq
         ghbg==
X-Gm-Message-State: AOJu0Yw0+XIzHE8gTpGLhnBls9huQUj1NvtRxuqr+5FUHxFyUIVa+L/f
        5dLq8NqT6/DO3xMgiPDDJ9/3wmxvDJ4zRcGJK84=
X-Google-Smtp-Source: AGHT+IGGLGFPwJG3gGRuDVNJEdp6+oiR1F1VAfisMPUrtVl8BKbbZQBRez6J+kz67YOMgUyEqNVpsw==
X-Received: by 2002:a05:6a00:cd2:b0:68c:3f2:5ff8 with SMTP id b18-20020a056a000cd200b0068c03f25ff8mr11629947pfv.1.1693899276493;
        Tue, 05 Sep 2023 00:34:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w11-20020a63b74b000000b00564b313d526sm8015154pgt.54.2023.09.05.00.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 00:34:35 -0700 (PDT)
Message-ID: <64f6da0b.630a0220.780a6.f192@mx.google.com>
Date:   Tue, 05 Sep 2023 00:34:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230905
Subject: next/master baseline: 226 runs, 22 regressions (next-20230905)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 226 runs, 22 regressions (next-20230905)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230905/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230905
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c50216cfa084d5eb67dc10e646a3283da1595bb6 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69fe4a9fd5d9b61286dac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f69fe4a9fd5d9b61286=
dad
        failing since 111 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64f6a08541b722719d286d78

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f6a08541b722719d286d89
        failing since 6 days (last pass: next-20230823, first fail: next-20=
230829)

    2023-09-05T03:29:09.294821  + <8>[   11.483826] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11434476_1.4.2.3.1>

    2023-09-05T03:29:09.295278  set +x

    2023-09-05T03:29:09.402611  / # #

    2023-09-05T03:29:09.504868  export SHELL=3D/bin/sh

    2023-09-05T03:29:09.505543  #

    2023-09-05T03:29:09.606849  / # export SHELL=3D/bin/sh. /lava-11434476/=
environment

    2023-09-05T03:29:09.607430  =


    2023-09-05T03:29:09.708570  / # . /lava-11434476/environment/lava-11434=
476/bin/lava-test-runner /lava-11434476/1

    2023-09-05T03:29:09.709641  =


    2023-09-05T03:29:09.714274  / # /lava-11434476/bin/lava-test-runner /la=
va-11434476/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f6a0cf6dcbfc68b1286d84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f6a0cf6dcbfc68b1286=
d85
        new failure (last pass: next-20230829) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69ffa8a5f6a9657286d88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f69ffa8a5f6a9657286=
d89
        failing since 111 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69fd4a9fd5d9b61286d77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f69fd4a9fd5d9b61286=
d78
        failing since 111 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64f6a06d86e49cbab6286dc8

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f6a06d86e49cbab6286dd9
        failing since 6 days (last pass: next-20230823, first fail: next-20=
230829)

    2023-09-05T03:28:32.219284  + <8>[   10.464209] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11434493_1.4.2.3.1>

    2023-09-05T03:28:32.220119  set +x

    2023-09-05T03:28:32.323582  #

    2023-09-05T03:28:32.323871  =


    2023-09-05T03:28:32.424418  / # #export SHELL=3D/bin/sh

    2023-09-05T03:28:32.424608  =


    2023-09-05T03:28:32.525200  / # export SHELL=3D/bin/sh. /lava-11434493/=
environment

    2023-09-05T03:28:32.525392  =


    2023-09-05T03:28:32.625886  / # . /lava-11434493/environment/lava-11434=
493/bin/lava-test-runner /lava-11434493/1

    2023-09-05T03:28:32.626157  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f6a000cf0af97d63286d7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f6a000cf0af97d63286=
d7c
        failing since 111 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64f6a06686e49cbab6286d77

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f6a06686e49cbab6286d88
        failing since 6 days (last pass: next-20230823, first fail: next-20=
230829)

    2023-09-05T03:28:21.398812  + <8>[   10.841994] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11434482_1.4.2.3.1>

    2023-09-05T03:28:21.399283  set +x

    2023-09-05T03:28:21.506710  / # #

    2023-09-05T03:28:21.609023  export SHELL=3D/bin/sh

    2023-09-05T03:28:21.609835  #

    2023-09-05T03:28:21.711368  / # export SHELL=3D/bin/sh. /lava-11434482/=
environment

    2023-09-05T03:28:21.712136  =


    2023-09-05T03:28:21.813603  / # . /lava-11434482/environment/lava-11434=
482/bin/lava-test-runner /lava-11434482/1

    2023-09-05T03:28:21.814733  =


    2023-09-05T03:28:21.819535  / # /lava-11434482/bin/lava-test-runner /la=
va-11434482/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69fe3a9fd5d9b61286da7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f69fe3a9fd5d9b61286=
da8
        failing since 111 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69dc0cd8d2b51d0286de4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f69dc0cd8d2b51d0286de9
        failing since 20 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-05T03:17:06.855651  + set<8>[   26.893088] <LAVA_SIGNAL_ENDRUN =
0_dmesg 87212_1.5.2.4.1>
    2023-09-05T03:17:06.856052   +x
    2023-09-05T03:17:06.964939  / # #
    2023-09-05T03:17:08.130631  export SHELL=3D/bin/sh
    2023-09-05T03:17:08.136699  #
    2023-09-05T03:17:09.580333  / # export SHELL=3D/bin/sh. /lava-87212/env=
ironment
    2023-09-05T03:17:09.586499  =

    2023-09-05T03:17:12.198691  / # . /lava-87212/environment/lava-87212/bi=
n/lava-test-runner /lava-87212/1
    2023-09-05T03:17:12.205509  =

    2023-09-05T03:17:12.215938  / # /lava-87212/bin/lava-test-runner /lava-=
87212/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69f50ad4fae9d16286d75

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f69f50ad4fae9d16286d7a
        failing since 20 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-05T03:23:50.345278  + set<8>[   27.810849] <LAVA_SIGNAL_ENDRUN =
0_dmesg 87251_1.5.2.4.1>
    2023-09-05T03:23:50.345442   +x
    2023-09-05T03:23:50.451400  / # #
    2023-09-05T03:23:51.610781  export SHELL=3D/bin/sh
    2023-09-05T03:23:51.616221  #
    2023-09-05T03:23:53.054083  / # export SHELL=3D/bin/sh. /lava-87251/env=
ironment
    2023-09-05T03:23:53.060197  =

    2023-09-05T03:23:55.672683  / # . /lava-87251/environment/lava-87251/bi=
n/lava-test-runner /lava-87251/1
    2023-09-05T03:23:55.679399  =

    2023-09-05T03:23:55.691393  / # /lava-87251/bin/lava-test-runner /lava-=
87251/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69fe1a9fd5d9b61286da1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f69fe1a9fd5d9b61286=
da2
        failing since 111 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f698249574e5322a286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f698249574e5322a286=
d6d
        failing since 223 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f698279574e5322a286d6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f698279574e5322a286=
d70
        failing since 208 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69809a0ccb508b0286d73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f69809a0ccb508b0286=
d74
        failing since 208 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69e6d5275240abc286d6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f69e6d5275240abc286=
d6d
        new failure (last pass: next-20230831) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69f53ad4fae9d16286d8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f69f53ad4fae9d16286d90
        failing since 27 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-09-05T03:23:34.900977  + set +x
    2023-09-05T03:23:34.901529  <8>[   28.772675] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1005183_1.5.2.4.1>
    2023-09-05T03:23:35.010682  / # #
    2023-09-05T03:23:36.481030  export SHELL=3D/bin/sh
    2023-09-05T03:23:36.502329  #
    2023-09-05T03:23:36.502938  / # export SHELL=3D/bin/sh
    2023-09-05T03:23:38.468262  / # . /lava-1005183/environment
    2023-09-05T03:23:42.083823  /lava-1005183/bin/lava-test-runner /lava-10=
05183/1
    2023-09-05T03:23:42.105712  . /lava-1005183/environment
    2023-09-05T03:23:42.106182  / # /lava-1005183/bin/lava-test-runner /lav=
a-1005183/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69e2864d36e7cf9286d77

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f69e2864d36e7cf9286d7a
        failing since 40 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-05T03:18:33.260320  / # #
    2023-09-05T03:18:34.721281  export SHELL=3D/bin/sh
    2023-09-05T03:18:34.741798  #
    2023-09-05T03:18:34.742005  / # export SHELL=3D/bin/sh
    2023-09-05T03:18:36.694787  / # . /lava-1005177/environment
    2023-09-05T03:18:40.290683  /lava-1005177/bin/lava-test-runner /lava-10=
05177/1
    2023-09-05T03:18:40.311480  . /lava-1005177/environment
    2023-09-05T03:18:40.311591  / # /lava-1005177/bin/lava-test-runner /lav=
a-1005177/1
    2023-09-05T03:18:40.394437  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-05T03:18:40.394652  + cd /lava-1005177/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69dd7381d64d315286de3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f69dd7381d64d315286de8
        failing since 40 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-05T03:18:41.670001  / # #

    2023-09-05T03:18:42.750644  export SHELL=3D/bin/sh

    2023-09-05T03:18:42.752428  #

    2023-09-05T03:18:44.243345  / # export SHELL=3D/bin/sh. /lava-11434377/=
environment

    2023-09-05T03:18:44.245287  =


    2023-09-05T03:18:46.969836  / # . /lava-11434377/environment/lava-11434=
377/bin/lava-test-runner /lava-11434377/1

    2023-09-05T03:18:46.972013  =


    2023-09-05T03:18:46.978613  / # /lava-11434377/bin/lava-test-runner /la=
va-11434377/1

    2023-09-05T03:18:47.042342  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-05T03:18:47.042841  + cd /lava-114343<8>[   29.530509] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11434377_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f6983ca10b80e613286d78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f6983ca10b80e613286=
d79
        failing since 208 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64f69d9ecef85a1fe1286d77

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f69d9fcef85a1fe1286d7c
        failing since 40 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-05T03:18:20.196769  / # #

    2023-09-05T03:18:20.298940  export SHELL=3D/bin/sh

    2023-09-05T03:18:20.299651  #

    2023-09-05T03:18:20.401072  / # export SHELL=3D/bin/sh. /lava-11434383/=
environment

    2023-09-05T03:18:20.401802  =


    2023-09-05T03:18:20.503316  / # . /lava-11434383/environment/lava-11434=
383/bin/lava-test-runner /lava-11434383/1

    2023-09-05T03:18:20.504433  =


    2023-09-05T03:18:20.521198  / # /lava-11434383/bin/lava-test-runner /la=
va-11434383/1

    2023-09-05T03:18:20.586254  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-05T03:18:20.586734  + cd /lava-1143438<8>[   19.365838] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11434383_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64f697f7ec47d67f9e286d72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230905/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f697f7ec47d67f9e286=
d73
        failing since 90 days (last pass: next-20230601, first fail: next-2=
0230606) =

 =20
