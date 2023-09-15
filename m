Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1537A1790
	for <lists+linux-next@lfdr.de>; Fri, 15 Sep 2023 09:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbjIOHfS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Sep 2023 03:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjIOHfR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Sep 2023 03:35:17 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E434BA1
        for <linux-next@vger.kernel.org>; Fri, 15 Sep 2023 00:35:09 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fc9a4ebe9so1657193b3a.2
        for <linux-next@vger.kernel.org>; Fri, 15 Sep 2023 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694763309; x=1695368109; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oiP1OStfsPL72m00I1jooyapay4OrCcOhv3eM7O5PbE=;
        b=n7ydXrqpBSY6yQYdnQJaMBh0txKCuwiM1MnLR/Py+Sjbe88XbSASvlpCSsAmSNb3SL
         dZDZ5g5pbirf/YttYpwKkkr1zZNYzZX6VkBkZPJTXv9Gijt9tJzGtWXYdWQfXnCd+5Rc
         KyXFC1iOnnc8WVmOXZny/Cro/oKTIPXeVpIgdxz3NlI4UjJhMjbhMdf4LjfWBJFlzXR4
         Iup6Cjrt5Ngn7F3CLBdNLGRYiw4x7wlrOjjzQ1o1mlG7r/cxoG+01ZhLd1FtuaIPer3k
         Sw65LsSb9hNLngOCzO0kYN673BpyI6iA6MlEPS8wb9lVTxm/IVuh920BN2v7HqtXHksY
         xB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763309; x=1695368109;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiP1OStfsPL72m00I1jooyapay4OrCcOhv3eM7O5PbE=;
        b=F/+pcScbaFacKC8v0NGj/pRej6a3X2S7Hzd71qq9h4frprK8JBIKogawhAWbGMIq8h
         ehd48nH47ylkAO7OPH/l9SVATmN/eNroN7JDn8r3C2UXvWQmGa3X/tH9cok/UhNNyVsa
         DZyM7kiv6srD1OHIQ8Udj+FBkpBCeO1z70OyclhGsMcUCqXf915Jz07AnHuzcHaQjfSO
         DYai/Neos0tDww9qx9UeBLAZkO7Okb7LrvlQzFp73Y6BKHY27ZZ1mmBaV3+CEf2+YWuo
         ER2Md86Vw7PILBeIhJItKM+AaqX9hVStorL5KjIhkI9vo44g+W5Vo4FKg1koXC5q5dK9
         lKnQ==
X-Gm-Message-State: AOJu0YyYPhqbGnA8fx8oziOl38uk2nj0VrT+1RH/sqC7r0U/QEP7w04+
        tyfNvWwGdiwAg6Dn9j0pQdFomo7O0kmt7rTV0UgmNg==
X-Google-Smtp-Source: AGHT+IGUlMNe4qvtYNT3M8WlGYxzy9Q/sa8dy0O4OnMsD56VyKM6zyCP5NZxZi8xkvTELp0h1m3LpQ==
X-Received: by 2002:a05:6a20:748d:b0:137:74f8:62ee with SMTP id p13-20020a056a20748d00b0013774f862eemr1207499pzd.18.1694763307669;
        Fri, 15 Sep 2023 00:35:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ix18-20020a170902f81200b001bc6536051bsm2808080plb.184.2023.09.15.00.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:35:07 -0700 (PDT)
Message-ID: <6504092b.170a0220.1f647.ab3c@mx.google.com>
Date:   Fri, 15 Sep 2023 00:35:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230915
X-Kernelci-Report-Type: test
Subject: next/master baseline: 232 runs, 67 regressions (next-20230915)
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

next/master baseline: 232 runs, 67 regressions (next-20230915)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-10     | defcon=
fig+kselftest          | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+videodec           | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 4          =

qemu_i386                    | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =

qemu_mips-malta              | mips   | lab-broonie   | gcc-10     | malta_=
defconfig              | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10     | malta_=
defconfig              | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230915/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230915
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dfa449a58323de195773cf928d99db4130702bf7 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cfa682c790938a8a0a68

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6503cfa682c790938a8a0a7d
        failing since 16 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-15T03:29:36.857283  + <8>[   11.313299] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11531039_1.4.2.3.1>

    2023-09-15T03:29:36.857720  set +x

    2023-09-15T03:29:36.967071  / # #

    2023-09-15T03:29:37.069202  export SHELL=3D/bin/sh

    2023-09-15T03:29:37.069746  #

    2023-09-15T03:29:37.170788  / # export SHELL=3D/bin/sh. /lava-11531039/=
environment

    2023-09-15T03:29:37.171448  =


    2023-09-15T03:29:37.272597  / # . /lava-11531039/environment/lava-11531=
039/bin/lava-test-runner /lava-11531039/1

    2023-09-15T03:29:37.273454  =


    2023-09-15T03:29:37.278557  / # /lava-11531039/bin/lava-test-runner /la=
va-11531039/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-10     | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ce62ae41f978ee8a0a54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/risc=
v/defconfig+kselftest/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/risc=
v/defconfig+kselftest/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ce62ae41f978ee8a0=
a55
        new failure (last pass: next-20230913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cf98d7e0f868038a0a47

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6503cf98d7e0f868038a0a5c
        failing since 16 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-15T03:29:15.309002  + <8>[   11.207871] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11531045_1.4.2.3.1>

    2023-09-15T03:29:15.309118  set +x

    2023-09-15T03:29:15.413408  / # #

    2023-09-15T03:29:15.514105  export SHELL=3D/bin/sh

    2023-09-15T03:29:15.514290  #

    2023-09-15T03:29:15.614811  / # export SHELL=3D/bin/sh. /lava-11531045/=
environment

    2023-09-15T03:29:15.615024  =


    2023-09-15T03:29:15.715557  / # . /lava-11531045/environment/lava-11531=
045/bin/lava-test-runner /lava-11531045/1

    2023-09-15T03:29:15.715845  =


    2023-09-15T03:29:15.719931  / # /lava-11531045/bin/lava-test-runner /la=
va-11531045/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cf9682c790938a8a0a43

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6503cf9682c790938a8a0a58
        failing since 16 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-15T03:29:15.586361  + <8>[   10.697613] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11531038_1.4.2.3.1>

    2023-09-15T03:29:15.586979  set +x

    2023-09-15T03:29:15.694896  / # #

    2023-09-15T03:29:15.797297  export SHELL=3D/bin/sh

    2023-09-15T03:29:15.798073  #

    2023-09-15T03:29:15.899624  / # export SHELL=3D/bin/sh. /lava-11531038/=
environment

    2023-09-15T03:29:15.900539  =


    2023-09-15T03:29:16.002521  / # . /lava-11531038/environment/lava-11531=
038/bin/lava-test-runner /lava-11531038/1

    2023-09-15T03:29:16.003854  =


    2023-09-15T03:29:16.008914  / # /lava-11531038/bin/lava-test-runner /la=
va-11531038/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c6ecea53685a938a0a5d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6503c6ecea53685a938a0a66
        failing since 30 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-15T02:52:08.328062  + set<8>[   28.558156] <LAVA_SIGNAL_ENDRUN =
0_dmesg 108513_1.5.2.4.1>
    2023-09-15T02:52:08.328670   +x
    2023-09-15T02:52:08.439141  / # #
    2023-09-15T02:52:09.605416  export SHELL=3D/bin/sh
    2023-09-15T02:52:09.611549  #
    2023-09-15T02:52:11.110479  / # export SHELL=3D/bin/sh. /lava-108513/en=
vironment
    2023-09-15T02:52:11.116635  =

    2023-09-15T02:52:13.837552  / # . /lava-108513/environment/lava-108513/=
bin/lava-test-runner /lava-108513/1
    2023-09-15T02:52:13.844245  =

    2023-09-15T02:52:13.850296  / # /lava-108513/bin/lava-test-runner /lava=
-108513/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cffd725e9f9cba8a0b02

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6503cffe725e9f9cba8a0b0b
        failing since 30 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-15T03:30:57.774201  + set<8>[   28.675204] <LAVA_SIGNAL_ENDRUN =
0_dmesg 108633_1.5.2.4.1>
    2023-09-15T03:30:57.774832   +x
    2023-09-15T03:30:57.884926  / # #
    2023-09-15T03:30:59.051027  export SHELL=3D/bin/sh
    2023-09-15T03:30:59.057172  #
    2023-09-15T03:31:00.554188  / # export SHELL=3D/bin/sh. /lava-108633/en=
vironment
    2023-09-15T03:31:00.560206  =

    2023-09-15T03:31:03.273572  / # . /lava-108633/environment/lava-108633/=
bin/lava-test-runner /lava-108633/1
    2023-09-15T03:31:03.280212  =

    2023-09-15T03:31:03.293274  / # /lava-108633/bin/lava-test-runner /lava=
-108633/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10     | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d5c68975d6b2b48a0ae5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6503d5c68975d6b2b48a0aee
        failing since 30 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-15T03:55:31.625382  + set<8>[   27.514529] <LAVA_SIGNAL_ENDRUN =
0_dmesg 108724_1.5.2.4.1>
    2023-09-15T03:55:31.625982   +x
    2023-09-15T03:55:31.736501  / # #
    2023-09-15T03:55:32.902091  export SHELL=3D/bin/sh
    2023-09-15T03:55:32.908053  #
    2023-09-15T03:55:34.403086  / # export SHELL=3D/bin/sh. /lava-108724/en=
vironment
    2023-09-15T03:55:34.408554  =

    2023-09-15T03:55:37.118782  / # . /lava-108724/environment/lava-108724/=
bin/lava-test-runner /lava-108724/1
    2023-09-15T03:55:37.125078  =

    2023-09-15T03:55:37.131498  / # /lava-108724/bin/lava-test-runner /lava=
-108724/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10     | defcon=
fig+arm...ook+videodec | 4          =


  Details:     https://kernelci.org/test/plan/id/6503d34d2ababa11f28a0a48

  Results:     163 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6503d34d2ababa1=
1f28a0a4b
        failing since 0 day (last pass: next-20230913, first fail: next-202=
30914)
        2 lines

    2023-09-15T03:45:01.358837  at virtual address 0000000000000008

    2023-09-15T03:45:01.362448  kern  :alert : Mem abort info:

    2023-09-15T03:45:01.365469  kern  :alert :   ESR =3D 0x0000000096000006

    2023-09-15T03:45:01.371882  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-09-15T03:45:01.372601  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-09-15T03:45:01.382625  <8>[   17.040143] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6503d34d2ababa1=
1f28a0a4c
        failing since 0 day (last pass: next-20230913, first fail: next-202=
30914)
        13 lines

    2023-09-15T03:45:01.355561  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   17.012832] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>
   =


  * baseline.bootrr.mtk-jpeg-probed: https://kernelci.org/test/case/id/6503=
d34d2ababa11f28a0a83
        failing since 0 day (last pass: next-20230913, first fail: next-202=
30914)

    2023-09-15T03:45:07.637047  <8>[   23.295520] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-jpeg-driver-present RESULT=3Dpass>

    2023-09-15T03:45:08.655568  /lava-11531238/1/../bin/lava-test-case

    2023-09-15T03:45:08.666827  <8>[   24.325701] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-jpeg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-scp-probed: https://kernelci.org/test/case/id/6503d=
34d2ababa11f28a0a85
        failing since 0 day (last pass: next-20230913, first fail: next-202=
30914)

    2023-09-15T03:45:06.589061  <8>[   22.247566] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-scp-driver-present RESULT=3Dpass>

    2023-09-15T03:45:07.606044  /lava-11531238/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cfd6725e9f9cba8a0aad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cfd6725e9f9cba8a0=
aae
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cf96d7e0f868038a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cf96d7e0f868038a0=
a43
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c818cf4cbdd6c58a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c818cf4cbdd6c58a0=
a52
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c81acf4cbdd6c58a0a56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c81acf4cbdd6c58a0=
a57
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c7c5b5ecda100a8a0aa7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c7c5b5ecda100a8a0=
aa8
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c828cf4cbdd6c58a0a5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c828cf4cbdd6c58a0=
a5d
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cfd5725e9f9cba8a0aaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cfd5725e9f9cba8a0=
aab
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | clang-17   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cf953fba26d58a8a0a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cf953fba26d58a8a0=
a85
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c7db77d950bae68a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c7db77d950bae68a0=
a43
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie   | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c81759bcc53c9f8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c81759bcc53c9f8a0=
a43
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c7c41e5d7a593f8a0aa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c7c41e5d7a593f8a0=
aa4
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora | gcc-10     | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6503c827cf4cbdd6c58a0a59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503c827cf4cbdd6c58a0=
a5a
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-broonie   | gcc-10     | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6503caaef2a497b5a68a0a46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503caaef2a497b5a68a0=
a47
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10     | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ca6c1515bfa2ae8a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ca6c1515bfa2ae8a0=
a45
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d2414a2129c16f8a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d2414a2129c16f8a0=
a45
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d14d4b2fb4f6868a0a67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d14d4b2fb4f6868a0=
a68
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ccb4375f43ca018a0a63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ccb4375f43ca018a0=
a64
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ce5fe922920d708a0a4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ce5fe922920d708a0=
a4f
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d0616ae71c9e4a8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d0616ae71c9e4a8a0=
a43
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cc4e16a7706a288a0a48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cc4e16a7706a288a0=
a49
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cd01b9343808048a0a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cd01b9343808048a0=
a4e
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cfbec776e119c48a0a71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cfbec776e119c48a0=
a72
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cb600ea52338318a0a67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cb600ea52338318a0=
a68
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d1c9758834b7b68a0d59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d1c9758834b7b68a0=
d5a
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d48731fe5656fb8a0a57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d48731fe5656fb8a0=
a58
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30914) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cb0e0ea52338318a0a48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cb0e0ea52338318a0=
a49
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d0e9de784058898a0a61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d0e9de784058898a0=
a62
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d4fbf68769b92a8a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d4fbf68769b92a8a0=
a48
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30914) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d2b97eb21164fe8a0b39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d2b97eb21164fe8a0=
b3a
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d14ef631c0964a8a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d14ef631c0964a8a0=
a45
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cc8c16a7706a288a0a8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cc8c16a7706a288a0=
a8e
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ce598cf419a30c8a0a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ce598cf419a30c8a0=
a4e
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d04d30081e092e8a0ab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d04d30081e092e8a0=
ab7
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cc39855b529d418a0a85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cc39855b529d418a0=
a86
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ccee3fc7c294eb8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ccee3fc7c294eb8a0=
a43
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cfa98ff19fd9ed8a0a76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cfa98ff19fd9ed8a0=
a77
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cb4c5a0f9351ce8a0a68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cb4c5a0f9351ce8a0=
a69
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d1ca5936a9e0f98a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d1ca5936a9e0f98a0=
a43
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d48831fe5656fb8a0a5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d48831fe5656fb8a0=
a5e
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30914) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cad2082209f0bc8a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cad2082209f0bc8a0=
a4b
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d0ea64bb4bf8ad8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d0ea64bb4bf8ad8a0=
a43
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d4fb8aa3081b248a0a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d4fb8aa3081b248a0=
a6e
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30914) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d2cd17c3c175318a0b35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d2cd17c3c175318a0=
b36
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-17   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d176758834b7b68a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230911073116+0176=
e8729ea4-1~exp1~20230911073215.40))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d176758834b7b68a0=
a4b
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ccb44671ebcdec8a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ccb44671ebcdec8a0=
a4b
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6503ce51768b8d07dc8a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503ce51768b8d07dc8a0=
a52
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d0c5de784058898a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d0c5de784058898a0=
a4b
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cc3bf0e67e87fa8a0a4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cc3bf0e67e87fa8a0=
a4d
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cced3f5a8e4eb08a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cced3f5a8e4eb08a0=
a43
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | gcc-10     | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cff9af66eb62f18a0ab2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cff9af66eb62f18a0=
ab3
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/6503cb4c4ff6ba4e198a0a78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503cb4c4ff6ba4e198a0=
a79
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d2554a2129c16f8a0a85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d2554a2129c16f8a0=
a86
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d48531fe5656fb8a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-broonie/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d48531fe5656fb8a0=
a52
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30914) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/6503caf84ff6ba4e198a0a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.71/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503caf84ff6ba4e198a0=
a4e
        failing since 1 day (last pass: next-20230912, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d1112ad01f1dc38a0a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d1112ad01f1dc38a0=
a52
        failing since 1 day (last pass: next-20230911, first fail: next-202=
30913) =

 =



platform                     | arch   | lab           | compiler   | defcon=
fig                    | regressions
-----------------------------+--------+---------------+------------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | rustc-1.71 | x86_64=
_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/6503d4fa8aa3081b248a0a6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.71 (Debian clang version 16.0.6 (++20230710041823+7c=
bf1a259152-1~exp1~20230710161844.102))
  Plain log:   https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230915/x86_=
64/x86_64_defconfig+rust/rustc-1.71/lab-collabora/baseline-qemu_x86_64-uefi=
-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6503d4fa8aa3081b248a0=
a6b
        failing since 0 day (last pass: next-20230912, first fail: next-202=
30914) =

 =20
