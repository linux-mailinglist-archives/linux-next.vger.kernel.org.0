Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D9D762460
	for <lists+linux-next@lfdr.de>; Tue, 25 Jul 2023 23:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjGYV0d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jul 2023 17:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjGYV0H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jul 2023 17:26:07 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312D42699
        for <linux-next@vger.kernel.org>; Tue, 25 Jul 2023 14:25:45 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-34642952736so32681675ab.3
        for <linux-next@vger.kernel.org>; Tue, 25 Jul 2023 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690320343; x=1690925143;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cbl6poHVllOX/96QGdi6tUYNkIFZiDxgALVDG9t1Hro=;
        b=fasmIuuBRXWP1wmNYcwZy8FmAwmYdPDuA3RVFP4tuo+WZltj0nrNwVPQhF+/EFFEYY
         VXYad6Xp4xVDnK+qv8q2kdXzdDgWsCH24zr73A+twHgXXzFvFKyW/QFD+ZRf0ehZjeu8
         lq5xEInkPT0vDZ699sOdskOWe9fVWgzCWmVPkTYcpWOaOmOy0fuEg4sYSQPSTPaP5Fkd
         dGAh747YaBvVXcK43Pvd/RZ4vUiFEps+RVcnqsCpOncwZvUmOSPX9jC2n8+BFALmbekv
         Te7ugzDLARbqfZAwlh8pB0f2MO4qyZYtR4dJyO1uh6iU69R3UiilE6PAVKO3fQUUy0j5
         kJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690320343; x=1690925143;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbl6poHVllOX/96QGdi6tUYNkIFZiDxgALVDG9t1Hro=;
        b=cakat4/TmJRTtzzDqVTTMMCJdpLGC4wFoJGrbQvWmXdUK6WXf3B6eoq/C2AgHfR4jO
         Xh1kMskN+vWaqflSKVy0HvAbZY7B8x2rGPNZMYoQ31ePohvQ89+Xkj31zAgHYLF2RZlN
         icl9emkYYTcB5Y1wngwekl84pIyK1tM8LZWpcMYFutb/o0XANPo6UXiTr6ANZ5u8zgff
         olRSVS2GyjF+ht8ErZSK0maN9diLq7yka8/fSSiI/KbP2NEcM3QrlGaarjsCMDrwiFh5
         MUk34Amtf5eOmT+ZUuu/3sSXPgZv7xkaE1ZunBIPvZsg2DH+vfKUjzN/DrLgjTC71J1h
         g4Zw==
X-Gm-Message-State: ABy/qLbbHO9pUDZnexIf1MT9gexurn4puZZ5o5NmYFWCWj3PXm/ZqQfS
        FDndnuGwQgF2s1KSO1yOEVqQt66GAEKsJ3gwzm+MFQ==
X-Google-Smtp-Source: APBJJlFNNu0LHLCBIfbcYlUulDaMgBsWJt78GSnZaEJoRDM5Dde2euXr2StDsadhs22pmON7rET96g==
X-Received: by 2002:a92:c247:0:b0:348:dba4:6418 with SMTP id k7-20020a92c247000000b00348dba46418mr277229ilo.6.1690320342490;
        Tue, 25 Jul 2023 14:25:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b20-20020a17090aa59400b00268160c6bb8sm26608pjq.31.2023.07.25.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 14:25:41 -0700 (PDT)
Message-ID: <64c03dd5.170a0220.b42d0.00ff@mx.google.com>
Date:   Tue, 25 Jul 2023 14:25:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230725
X-Kernelci-Report-Type: test
Subject: next/master baseline: 498 runs, 58 regressions (next-20230725)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 498 runs, 58 regressions (next-20230725)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_riscv64                 | riscv  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

qemu_riscv64                 | riscv  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =

qemu_riscv64                 | riscv  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_riscv64                 | riscv  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230725/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230725
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1e25dd7772483f477f79986d956028e9f47f990a =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c008b3ea7cbaf7178ace3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c008b3ea7cbaf7178ac=
e3b
        failing since 69 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0212964f29f41388ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0212964f29f41388ac=
e29
        failing since 4 days (last pass: next-20230718, first fail: next-20=
230721) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c001801f1e2095e98ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c001801f1e2095e98ac=
e1e
        failing since 12 days (last pass: next-20230712, first fail: next-2=
0230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0016b3f4108326d8ace5a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0016b3f4108326d8ace5f
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-25T17:07:33.223988  + set +x

    2023-07-25T17:07:33.230453  <8>[   10.514659] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11137172_1.4.2.3.1>

    2023-07-25T17:07:33.334986  / # #

    2023-07-25T17:07:33.435741  export SHELL=3D/bin/sh

    2023-07-25T17:07:33.435933  #

    2023-07-25T17:07:33.536478  / # export SHELL=3D/bin/sh. /lava-11137172/=
environment

    2023-07-25T17:07:33.536635  =


    2023-07-25T17:07:33.637114  / # . /lava-11137172/environment/lava-11137=
172/bin/lava-test-runner /lava-11137172/1

    2023-07-25T17:07:33.637366  =


    2023-07-25T17:07:33.643162  / # /lava-11137172/bin/lava-test-runner /la=
va-11137172/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c008bbea7cbaf7178ace4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c008bbea7cbaf7178ac=
e4d
        failing since 69 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00164dea824c4e68ace1e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00164dea824c4e68ace23
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-25T17:07:32.336976  <8>[   11.022790] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11137180_1.4.2.3.1>

    2023-07-25T17:07:32.339902  + set +x

    2023-07-25T17:07:32.442217  =


    2023-07-25T17:07:32.543496  / # #export SHELL=3D/bin/sh

    2023-07-25T17:07:32.544350  =


    2023-07-25T17:07:32.646273  / # export SHELL=3D/bin/sh. /lava-11137180/=
environment

    2023-07-25T17:07:32.647012  =


    2023-07-25T17:07:32.748943  / # . /lava-11137180/environment/lava-11137=
180/bin/lava-test-runner /lava-11137180/1

    2023-07-25T17:07:32.750490  =


    2023-07-25T17:07:32.755628  / # /lava-11137180/bin/lava-test-runner /la=
va-11137180/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c006f3ee3d9f2ad88ace4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c006f3ee3d9f2ad88ac=
e4d
        failing since 183 days (last pass: next-20230120, first fail: next-=
20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c003ace5f3f6bc6b8ace3d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c003ace5f3f6bc6b8ace40
        failing since 11 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-25T17:17:10.114797  [   12.110953] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1238046_1.5.2.4.1>
    2023-07-25T17:17:10.220553  =

    2023-07-25T17:17:10.321784  / # #export SHELL=3D/bin/sh
    2023-07-25T17:17:10.322244  =

    2023-07-25T17:17:10.423169  / # export SHELL=3D/bin/sh. /lava-1238046/e=
nvironment
    2023-07-25T17:17:10.423575  =

    2023-07-25T17:17:10.524545  / # . /lava-1238046/environment/lava-123804=
6/bin/lava-test-runner /lava-1238046/1
    2023-07-25T17:17:10.525272  =

    2023-07-25T17:17:10.529049  / # /lava-1238046/bin/lava-test-runner /lav=
a-1238046/1
    2023-07-25T17:17:10.550927  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c003d4a0103978fd8acf80

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c003d4a0103978fd8acf83
        failing since 11 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-25T17:17:49.173818  + [   11.822889] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1238054_1.5.2.4.1>
    2023-07-25T17:17:49.174120  set +x
    2023-07-25T17:17:49.279869  =

    2023-07-25T17:17:49.381382  / # #export SHELL=3D/bin/sh
    2023-07-25T17:17:49.381854  =

    2023-07-25T17:17:49.482899  / # export SHELL=3D/bin/sh. /lava-1238054/e=
nvironment
    2023-07-25T17:17:49.483326  =

    2023-07-25T17:17:49.584418  / # . /lava-1238054/environment/lava-123805=
4/bin/lava-test-runner /lava-1238054/1
    2023-07-25T17:17:49.585485  =

    2023-07-25T17:17:49.589112  / # /lava-1238054/bin/lava-test-runner /lav=
a-1238054/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00d4857a12a2fd48ace62

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00d4857a12a2fd48ace65
        failing since 11 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-25T17:58:19.496039  + [   12.040855] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1238107_1.5.2.4.1>
    2023-07-25T17:58:19.496333  set +x
    2023-07-25T17:58:19.602192  =

    2023-07-25T17:58:19.703461  / # #export SHELL=3D/bin/sh
    2023-07-25T17:58:19.703918  =

    2023-07-25T17:58:19.804893  / # export SHELL=3D/bin/sh. /lava-1238107/e=
nvironment
    2023-07-25T17:58:19.805348  =

    2023-07-25T17:58:19.906346  / # . /lava-1238107/environment/lava-123810=
7/bin/lava-test-runner /lava-1238107/1
    2023-07-25T17:58:19.907116  =

    2023-07-25T17:58:19.911312  / # /lava-1238107/bin/lava-test-runner /lav=
a-1238107/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00886cb970321c28ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c00886cb970321c28ac=
e29
        new failure (last pass: next-20230718) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c004d2c422cd378f8ace2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c004d2c422cd378f8ac=
e2e
        new failure (last pass: next-20230724) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00888ac35b0ca038acfa0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c00888ac35b0ca038ac=
fa1
        failing since 69 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c008a3cb970321c28ace44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c008a3cb970321c28ac=
e45
        failing since 69 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0014399c79beb8e8ace2b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0014399c79beb8e8ace30
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-25T17:07:06.645493  + set +x

    2023-07-25T17:07:06.651218  <8>[   10.590140] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11137182_1.4.2.3.1>

    2023-07-25T17:07:06.755728  / # #

    2023-07-25T17:07:06.856382  export SHELL=3D/bin/sh

    2023-07-25T17:07:06.856593  #

    2023-07-25T17:07:06.957173  / # export SHELL=3D/bin/sh. /lava-11137182/=
environment

    2023-07-25T17:07:06.957446  =


    2023-07-25T17:07:07.058065  / # . /lava-11137182/environment/lava-11137=
182/bin/lava-test-runner /lava-11137182/1

    2023-07-25T17:07:07.058427  =


    2023-07-25T17:07:07.063194  / # /lava-11137182/bin/lava-test-runner /la=
va-11137182/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0014e29a4b9313f8ace8a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0014e29a4b9313f8ace8f
        failing since 119 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-25T17:07:13.852945  <8>[   10.740455] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11137200_1.4.2.3.1>

    2023-07-25T17:07:13.856445  + set +x

    2023-07-25T17:07:13.961429  / # #

    2023-07-25T17:07:14.063804  export SHELL=3D/bin/sh

    2023-07-25T17:07:14.064761  #

    2023-07-25T17:07:14.166542  / # export SHELL=3D/bin/sh. /lava-11137200/=
environment

    2023-07-25T17:07:14.167277  =


    2023-07-25T17:07:14.268485  / # . /lava-11137200/environment/lava-11137=
200/bin/lava-test-runner /lava-11137200/1

    2023-07-25T17:07:14.268774  =


    2023-07-25T17:07:14.274283  / # /lava-11137200/bin/lava-test-runner /la=
va-11137200/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c008bb9fac2065fc8aceaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c008bb9fac2065fc8ac=
eab
        failing since 69 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0039ab3cd0ab8178ace3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0039ab3cd0ab8178ac=
e40
        new failure (last pass: next-20230717) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00dcae1b20027b58ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-juno-ubo=
ot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-juno-ubo=
ot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c00dcae1b20027b58ac=
e1e
        new failure (last pass: next-20230719) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c002a1dc1de3bb508ace31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c002a1dc1de3bb508ac=
e32
        failing since 96 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00cdf70f8e759068ace52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c00ce070f8e759068ac=
e53
        failing since 96 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0014529a4b9313f8ace60

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0014529a4b9313f8ace65
        failing since 32 days (last pass: next-20230622, first fail: next-2=
0230623)

    2023-07-25T17:07:04.434026  + set +x<8>[   11.673610] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11137190_1.4.2.3.1>

    2023-07-25T17:07:04.434518  =


    2023-07-25T17:07:04.542279  / # #

    2023-07-25T17:07:04.644561  export SHELL=3D/bin/sh

    2023-07-25T17:07:04.645401  #

    2023-07-25T17:07:04.746942  / # export SHELL=3D/bin/sh. /lava-11137190/=
environment

    2023-07-25T17:07:04.747684  =


    2023-07-25T17:07:04.849210  / # . /lava-11137190/environment/lava-11137=
190/bin/lava-test-runner /lava-11137190/1

    2023-07-25T17:07:04.850387  =


    2023-07-25T17:07:04.854633  / # /lava-11137190/bin/lava-test-runner /la=
va-11137190/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00888cb970321c28ace2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c00888cb970321c28ac=
e2c
        failing since 69 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c005dec5b32ddb7d8ace48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c005dec5b32ddb7d8ac=
e49
        new failure (last pass: next-20230712) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_riscv64                 | riscv  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c008f945cbeabdee8acef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c008f945cbeabdee8ac=
ef5
        new failure (last pass: next-20230718) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_riscv64                 | riscv  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c006b1168dfe47888ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c006b1168dfe47888ac=
e1d
        new failure (last pass: next-20230718) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_riscv64                 | riscv  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0050f426e4fee4e8ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0050f426e4fee4e8ac=
e21
        new failure (last pass: next-20230724) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_riscv64                 | riscv  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00431be8413471b8aced7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c00431be8413471b8ac=
ed8
        new failure (last pass: next-20230724) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_smp8_riscv64            | riscv  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c008f844a95b4f2e8ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c008f844a95b4f2e8ac=
e24
        new failure (last pass: next-20230718) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_smp8_riscv64            | riscv  | lab-collabora   | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c006b09b8ba9352d8ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/clang-17/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c006b09b8ba9352d8ac=
e23
        new failure (last pass: next-20230718) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_smp8_riscv64            | riscv  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c004e7823b02c8508ace8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c004e7823b02c8508ac=
e8b
        new failure (last pass: next-20230724) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_smp8_riscv64            | riscv  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0042698d58657d68ace64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/risc=
v/defconfig/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c0042698d58657d68ac=
e65
        new failure (last pass: next-20230724) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0262c27febe59a18acffe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0262c27febe59a18ad001
        failing since 7 days (last pass: next-20230710, first fail: next-20=
230717)

    2023-07-25T19:44:30.245538  / # #
    2023-07-25T19:44:31.708174  export SHELL=3D/bin/sh
    2023-07-25T19:44:31.728788  #
    2023-07-25T19:44:31.728997  / # export SHELL=3D/bin/sh
    2023-07-25T19:44:33.615903  / # . /lava-989104/environment
    2023-07-25T19:44:37.076102  /lava-989104/bin/lava-test-runner /lava-989=
104/1
    2023-07-25T19:44:37.097022  . /lava-989104/environment
    2023-07-25T19:44:37.097171  / # /lava-989104/bin/lava-test-runner /lava=
-989104/1
    2023-07-25T19:44:37.142129  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T19:44:37.179660  + cd /lava-989104/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c003407a0526f1a38ace3e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c003417a0526f1a38ace41
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:15:28.944510  / # #
    2023-07-25T17:15:30.404490  export SHELL=3D/bin/sh
    2023-07-25T17:15:30.424953  #
    2023-07-25T17:15:30.425104  / # export SHELL=3D/bin/sh
    2023-07-25T17:15:32.307631  / # . /lava-989018/environment
    2023-07-25T17:15:35.759939  /lava-989018/bin/lava-test-runner /lava-989=
018/1
    2023-07-25T17:15:35.780561  . /lava-989018/environment
    2023-07-25T17:15:35.780687  / # /lava-989018/bin/lava-test-runner /lava=
-989018/1
    2023-07-25T17:15:35.862168  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T17:15:35.862330  + cd /lava-989018/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c003f395ffbee5f18ace21

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c003f395ffbee5f18ace24
        failing since 7 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-25T17:18:24.182607  / # #
    2023-07-25T17:18:25.645384  export SHELL=3D/bin/sh
    2023-07-25T17:18:25.665971  #
    2023-07-25T17:18:25.666177  / # export SHELL=3D/bin/sh
    2023-07-25T17:18:27.552029  / # . /lava-989024/environment
    2023-07-25T17:18:31.010746  /lava-989024/bin/lava-test-runner /lava-989=
024/1
    2023-07-25T17:18:31.031655  . /lava-989024/environment
    2023-07-25T17:18:31.031765  / # /lava-989024/bin/lava-test-runner /lava=
-989024/1
    2023-07-25T17:18:31.077414  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T17:18:31.114391  + cd /lava-989024/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c004a8b8ff3e71b28aceef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c004a8b8ff3e71b28acef2
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:21:30.327700  / # #
    2023-07-25T17:21:31.787391  export SHELL=3D/bin/sh
    2023-07-25T17:21:31.807839  #
    2023-07-25T17:21:31.808015  / # export SHELL=3D/bin/sh
    2023-07-25T17:21:33.689075  / # . /lava-989034/environment
    2023-07-25T17:21:37.140369  /lava-989034/bin/lava-test-runner /lava-989=
034/1
    2023-07-25T17:21:37.161137  . /lava-989034/environment
    2023-07-25T17:21:37.161248  / # /lava-989034/bin/lava-test-runner /lava=
-989034/1
    2023-07-25T17:21:37.244258  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T17:21:37.244475  + cd /lava-989034/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0082dda817b65b88ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0082dda817b65b88ace1f
        new failure (last pass: next-20230710)

    2023-07-25T17:36:14.835534  / # #
    2023-07-25T17:36:16.295331  export SHELL=3D/bin/sh
    2023-07-25T17:36:16.315803  #
    2023-07-25T17:36:16.315976  / # export SHELL=3D/bin/sh
    2023-07-25T17:36:18.198610  / # . /lava-989053/environment
    2023-07-25T17:36:21.651191  /lava-989053/bin/lava-test-runner /lava-989=
053/1
    2023-07-25T17:36:21.671846  . /lava-989053/environment
    2023-07-25T17:36:21.671979  / # /lava-989053/bin/lava-test-runner /lava=
-989053/1
    2023-07-25T17:36:21.715849  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T17:36:21.752600  + cd /lava-989053/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0090744a95b4f2e8ace36

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0090844a95b4f2e8ace39
        failing since 7 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-25T17:39:56.923431  / # #
    2023-07-25T17:39:58.387267  export SHELL=3D/bin/sh
    2023-07-25T17:39:58.408106  #
    2023-07-25T17:39:58.408378  / # export SHELL=3D/bin/sh
    2023-07-25T17:40:00.294191  / # . /lava-989059/environment
    2023-07-25T17:40:03.752208  /lava-989059/bin/lava-test-runner /lava-989=
059/1
    2023-07-25T17:40:03.773035  . /lava-989059/environment
    2023-07-25T17:40:03.773147  / # /lava-989059/bin/lava-test-runner /lava=
-989059/1
    2023-07-25T17:40:03.854189  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T17:40:03.854489  + cd /lava-989059/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00d2c2b96b2b37a8ace1e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00d2c2b96b2b37a8ace21
        failing since 6 days (last pass: next-20230714, first fail: next-20=
230719)

    2023-07-25T17:57:50.581198  / # #
    2023-07-25T17:57:52.045338  export SHELL=3D/bin/sh
    2023-07-25T17:57:52.065966  #
    2023-07-25T17:57:52.066189  / # export SHELL=3D/bin/sh
    2023-07-25T17:57:53.952297  / # . /lava-989076/environment
    2023-07-25T17:57:57.410678  /lava-989076/bin/lava-test-runner /lava-989=
076/1
    2023-07-25T17:57:57.431733  . /lava-989076/environment
    2023-07-25T17:57:57.431909  / # /lava-989076/bin/lava-test-runner /lava=
-989076/1
    2023-07-25T17:57:57.511403  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-25T17:57:57.511692  + cd /lava-989076/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64c002b963f0f0bac48ace7c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
64c002b963f0f0bac48ace80
        failing since 152 days (last pass: next-20230214, first fail: next-=
20230222)

    2023-07-25T17:14:56.424336  /lava-11137237/1/../bin/lava-test-case

    2023-07-25T17:14:56.471168  <8>[   22.495552] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-07-25T17:14:56.471683  /lava-11137237/1/../bin/lava-test-case

    2023-07-25T17:14:56.471967  <8>[   22.510902] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-07-25T17:14:56.472209  + set +x

    2023-07-25T17:14:56.472451  <8>[   22.524512] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 11137237_1.5.2.4.5>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c002b963f0f0bac48ace81
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:14:54.027379  / # #

    2023-07-25T17:14:54.129452  export SHELL=3D/bin/sh

    2023-07-25T17:14:54.130172  #

    2023-07-25T17:14:54.231587  / # export SHELL=3D/bin/sh. /lava-11137237/=
environment

    2023-07-25T17:14:54.232310  =


    2023-07-25T17:14:54.333776  / # . /lava-11137237/environment/lava-11137=
237/bin/lava-test-runner /lava-11137237/1

    2023-07-25T17:14:54.334873  =


    2023-07-25T17:14:54.351564  / # /lava-11137237/bin/lava-test-runner /la=
va-11137237/1

    2023-07-25T17:14:54.405542  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:14:54.406057  + cd /lav<8>[   20.437728] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11137237_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c003597a0526f1a38acef6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a7796=
0-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a7796=
0-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c003597a0526f1a38acefb
        failing since 7 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-25T17:17:37.568237  / # #

    2023-07-25T17:17:37.670442  export SHELL=3D/bin/sh

    2023-07-25T17:17:37.671148  #

    2023-07-25T17:17:37.772493  / # export SHELL=3D/bin/sh. /lava-11137275/=
environment

    2023-07-25T17:17:37.773244  =


    2023-07-25T17:17:37.874769  / # . /lava-11137275/environment/lava-11137=
275/bin/lava-test-runner /lava-11137275/1

    2023-07-25T17:17:37.875815  =


    2023-07-25T17:17:37.892568  / # /lava-11137275/bin/lava-test-runner /la=
va-11137275/1

    2023-07-25T17:17:37.943035  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:17:37.943540  + cd /lav<8>[   19.391421] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11137275_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64c00396a23f77861d8ace21

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
64c00396a23f77861d8ace25
        failing since 160 days (last pass: next-20230214, first fail: next-=
20230215)

    2023-07-25T17:18:30.859981  /lava-11137294/1/../bin/lava-test-case

    2023-07-25T17:18:30.860479  <8>[   21.338734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-07-25T17:18:30.860765  /lava-11137294/1/../bin/lava-test-case

    2023-07-25T17:18:30.861089  <8>[   21.354558] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-07-25T17:18:30.861332  + set +x

    2023-07-25T17:18:30.861563  <8>[   21.368108] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 11137294_1.5.2.4.5>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00396a23f77861d8ace26
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:18:28.420251  / # #

    2023-07-25T17:18:28.522547  export SHELL=3D/bin/sh

    2023-07-25T17:18:28.523324  #

    2023-07-25T17:18:28.624778  / # export SHELL=3D/bin/sh. /lava-11137294/=
environment

    2023-07-25T17:18:28.625521  =


    2023-07-25T17:18:28.727069  / # . /lava-11137294/environment/lava-11137=
294/bin/lava-test-runner /lava-11137294/1

    2023-07-25T17:18:28.728268  =


    2023-07-25T17:18:28.744394  / # /lava-11137294/bin/lava-test-runner /la=
va-11137294/1

    2023-07-25T17:18:28.795101  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:18:28.795605  + cd /lava-111372<8>[   19.283573] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11137294_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00525cb5ed8a1968ace45

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00525cb5ed8a1968ace4a
        new failure (last pass: next-20230712)

    2023-07-25T17:25:03.551558  #

    2023-07-25T17:25:03.652121  / # #export SHELL=3D/bin/sh

    2023-07-25T17:25:03.652211  =


    2023-07-25T17:25:03.752608  / # export SHELL=3D/bin/sh. /lava-11137396/=
environment

    2023-07-25T17:25:03.752731  =


    2023-07-25T17:25:03.853147  / # . /lava-11137396/environment/lava-11137=
396/bin/lava-test-runner /lava-11137396/1

    2023-07-25T17:25:03.853307  =


    2023-07-25T17:25:03.864969  / # /lava-11137396/bin/lava-test-runner /la=
va-11137396/1

    2023-07-25T17:25:04.223346  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:25:04.223421  + cd /lava-11137396/1/tests/1_bootrr
 =

    ... (31 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00793f8987f60868acecf

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00793f8987f60868aced4
        new failure (last pass: next-20230710)

    2023-07-25T17:35:33.814571  / # #

    2023-07-25T17:35:33.916739  export SHELL=3D/bin/sh

    2023-07-25T17:35:33.917495  #

    2023-07-25T17:35:34.018898  / # export SHELL=3D/bin/sh. /lava-11137504/=
environment

    2023-07-25T17:35:34.019635  =


    2023-07-25T17:35:34.121070  / # . /lava-11137504/environment/lava-11137=
504/bin/lava-test-runner /lava-11137504/1

    2023-07-25T17:35:34.122214  =


    2023-07-25T17:35:34.123358  / # /lava-11137504/bin/lava-test-runner /la=
va-11137504/1

    2023-07-25T17:35:34.188726  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:35:34.189267  + cd /lava-111375<8>[   19.315169] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11137504_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00cf670f8e759068acec0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
60-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
60-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00cf670f8e759068acec5
        failing since 6 days (last pass: next-20230714, first fail: next-20=
230719)

    2023-07-25T17:58:30.402629  / # #

    2023-07-25T17:58:30.504737  export SHELL=3D/bin/sh

    2023-07-25T17:58:30.505479  #

    2023-07-25T17:58:30.606888  / # export SHELL=3D/bin/sh. /lava-11137766/=
environment

    2023-07-25T17:58:30.607597  =


    2023-07-25T17:58:30.709037  / # . /lava-11137766/environment/lava-11137=
766/bin/lava-test-runner /lava-11137766/1

    2023-07-25T17:58:30.710110  =


    2023-07-25T17:58:30.726769  / # /lava-11137766/bin/lava-test-runner /la=
va-11137766/1

    2023-07-25T17:58:30.777435  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:58:30.777942  + cd /lava-111377<8>[   20.418404] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11137766_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c002d2b52bd1bf8e8ace27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c002d2b52bd1bf8e8ace2c
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:13:36.422669  / # #

    2023-07-25T17:13:37.501610  export SHELL=3D/bin/sh

    2023-07-25T17:13:37.503396  #

    2023-07-25T17:13:38.992718  / # export SHELL=3D/bin/sh. /lava-11137239/=
environment

    2023-07-25T17:13:38.994552  =


    2023-07-25T17:13:41.717303  / # . /lava-11137239/environment/lava-11137=
239/bin/lava-test-runner /lava-11137239/1

    2023-07-25T17:13:41.719445  =


    2023-07-25T17:13:41.730689  / # /lava-11137239/bin/lava-test-runner /la=
va-11137239/1

    2023-07-25T17:13:41.770964  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:13:41.789797  + cd /lav<8>[   29.517013] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11137239_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0037279cf533fd98ace32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0037279cf533fd98ace37
        failing since 7 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-25T17:16:26.788170  / # #

    2023-07-25T17:16:27.862487  export SHELL=3D/bin/sh

    2023-07-25T17:16:27.863767  #

    2023-07-25T17:16:29.348640  / # export SHELL=3D/bin/sh. /lava-11137282/=
environment

    2023-07-25T17:16:29.350470  =


    2023-07-25T17:16:32.072442  / # . /lava-11137282/environment/lava-11137=
282/bin/lava-test-runner /lava-11137282/1

    2023-07-25T17:16:32.074526  =


    2023-07-25T17:16:32.087123  / # /lava-11137282/bin/lava-test-runner /la=
va-11137282/1

    2023-07-25T17:16:32.146351  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:16:32.146819  + cd /lava-111372<8>[   28.522421] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11137282_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00399538510fefc8ace50

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00399538510fefc8ace55
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:17:06.616875  / # #

    2023-07-25T17:17:07.695976  export SHELL=3D/bin/sh

    2023-07-25T17:17:07.697898  #

    2023-07-25T17:17:09.187822  / # export SHELL=3D/bin/sh. /lava-11137286/=
environment

    2023-07-25T17:17:09.189659  =


    2023-07-25T17:17:11.909597  / # . /lava-11137286/environment/lava-11137=
286/bin/lava-test-runner /lava-11137286/1

    2023-07-25T17:17:11.910933  =


    2023-07-25T17:17:11.926275  / # /lava-11137286/bin/lava-test-runner /la=
va-11137286/1

    2023-07-25T17:17:11.942267  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:17:11.985415  + cd /lava-11137286/<8>[   28.551872] <LAVA=
_SIGNAL_STARTRUN 1_bootrr 11137286_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0052acb5ed8a1968ace54

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0052acb5ed8a1968ace59
        new failure (last pass: next-20230712)

    2023-07-25T17:23:41.684874  <8>[   35.338270][  T222] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11137397_1.5.2.4.1>

    2023-07-25T17:23:41.685317  + set +x

    2023-07-25T17:23:41.790477  #

    2023-07-25T17:23:42.868013  / # #export SHELL=3D/bin/sh

    2023-07-25T17:23:42.869269  =


    2023-07-25T17:23:44.352820  / # export SHELL=3D/bin/sh. /lava-11137397/=
environment

    2023-07-25T17:23:44.354101  =


    2023-07-25T17:23:47.067748  / # . /lava-11137397/environment/lava-11137=
397/bin/lava-test-runner /lava-11137397/1

    2023-07-25T17:23:47.070101  =


    2023-07-25T17:23:47.084812  / # /lava-11137397/bin/lava-test-runner /la=
va-11137397/1
 =

    ... (40 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c007be0c9ac3ead08ace35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c007be0c9ac3ead08ace3a
        new failure (last pass: next-20230710)

    2023-07-25T17:34:49.311276  / # #

    2023-07-25T17:34:50.391915  export SHELL=3D/bin/sh

    2023-07-25T17:34:50.393771  #

    2023-07-25T17:34:51.884003  / # export SHELL=3D/bin/sh. /lava-11137508/=
environment

    2023-07-25T17:34:51.885817  =


    2023-07-25T17:34:54.605113  / # . /lava-11137508/environment/lava-11137=
508/bin/lava-test-runner /lava-11137508/1

    2023-07-25T17:34:54.607275  =


    2023-07-25T17:34:54.618096  / # /lava-11137508/bin/lava-test-runner /la=
va-11137508/1

    2023-07-25T17:34:54.677893  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:34:54.678421  + cd /lava-<8>[   29.560441] <LAVA_SIGNAL_S=
TARTRUN 1_bootrr 11137508_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00d0f70f8e759068acecc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00d0f70f8e759068aced1
        failing since 6 days (last pass: next-20230714, first fail: next-20=
230719)

    2023-07-25T17:57:19.018783  / # #

    2023-07-25T17:57:20.096982  export SHELL=3D/bin/sh

    2023-07-25T17:57:20.098753  #

    2023-07-25T17:57:21.587961  / # export SHELL=3D/bin/sh. /lava-11137764/=
environment

    2023-07-25T17:57:21.589817  =


    2023-07-25T17:57:24.312589  / # . /lava-11137764/environment/lava-11137=
764/bin/lava-test-runner /lava-11137764/1

    2023-07-25T17:57:24.315060  =


    2023-07-25T17:57:24.327275  / # /lava-11137764/bin/lava-test-runner /la=
va-11137764/1

    2023-07-25T17:57:24.343180  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:57:24.386463  + cd /lav<8>[   28.472709] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11137764_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c002cda0529ffc328ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c002cda0529ffc328ace21
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:15:05.952457  / # #

    2023-07-25T17:15:06.054647  export SHELL=3D/bin/sh

    2023-07-25T17:15:06.055355  #

    2023-07-25T17:15:06.156796  / # export SHELL=3D/bin/sh. /lava-11137236/=
environment

    2023-07-25T17:15:06.157563  =


    2023-07-25T17:15:06.259011  / # . /lava-11137236/environment/lava-11137=
236/bin/lava-test-runner /lava-11137236/1

    2023-07-25T17:15:06.260107  =


    2023-07-25T17:15:06.276704  / # /lava-11137236/bin/lava-test-runner /la=
va-11137236/1

    2023-07-25T17:15:06.317496  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:15:06.353718  + cd /lava-11137236/1/tests/1_boot<8>[   17=
.703800] <LAVA_SIGNAL_STARTRUN 1_bootrr 11137236_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c0036d456ff32b7c8acea9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c0036d456ff32b7c8aceae
        failing since 7 days (last pass: next-20230714, first fail: next-20=
230717)

    2023-07-25T17:17:48.964055  / # #

    2023-07-25T17:17:49.064828  export SHELL=3D/bin/sh

    2023-07-25T17:17:49.065065  #

    2023-07-25T17:17:49.165648  / # export SHELL=3D/bin/sh. /lava-11137271/=
environment

    2023-07-25T17:17:49.165882  =


    2023-07-25T17:17:49.266477  / # . /lava-11137271/environment/lava-11137=
271/bin/lava-test-runner /lava-11137271/1

    2023-07-25T17:17:49.266796  =


    2023-07-25T17:17:49.277162  / # /lava-11137271/bin/lava-test-runner /la=
va-11137271/1

    2023-07-25T17:17:49.321116  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:17:49.352033  + cd /lava-11137271/1/tests/1_boot<8>[   17=
.214607] <LAVA_SIGNAL_STARTRUN 1_bootrr 11137271_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00395b3cd0ab8178ace31

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00395b3cd0ab8178ace36
        failing since 7 days (last pass: next-20230713, first fail: next-20=
230717)

    2023-07-25T17:18:35.256628  / # #

    2023-07-25T17:18:35.358920  export SHELL=3D/bin/sh

    2023-07-25T17:18:35.359633  #

    2023-07-25T17:18:35.461069  / # export SHELL=3D/bin/sh. /lava-11137290/=
environment

    2023-07-25T17:18:35.461783  =


    2023-07-25T17:18:35.563275  / # . /lava-11137290/environment/lava-11137=
290/bin/lava-test-runner /lava-11137290/1

    2023-07-25T17:18:35.564496  =


    2023-07-25T17:18:35.581089  / # /lava-11137290/bin/lava-test-runner /la=
va-11137290/1

    2023-07-25T17:18:35.650010  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:18:35.650521  + cd /lava-11137290/1/tests/1_boot<8>[   16=
.971928] <LAVA_SIGNAL_STARTRUN 1_bootrr 11137290_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00791f8987f60868aceb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c00792f8987f60868acebe
        new failure (last pass: next-20230710)

    2023-07-25T17:35:44.409274  / # #

    2023-07-25T17:35:44.511362  export SHELL=3D/bin/sh

    2023-07-25T17:35:44.512054  #

    2023-07-25T17:35:44.613471  / # export SHELL=3D/bin/sh. /lava-11137502/=
environment

    2023-07-25T17:35:44.614166  =


    2023-07-25T17:35:44.715591  / # . /lava-11137502/environment/lava-11137=
502/bin/lava-test-runner /lava-11137502/1

    2023-07-25T17:35:44.716651  =


    2023-07-25T17:35:44.733380  / # /lava-11137502/bin/lava-test-runner /la=
va-11137502/1

    2023-07-25T17:35:44.802297  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-25T17:35:44.802789  + cd /lava-11137502/1/tests/1_boot<8>[   17=
.012954] <LAVA_SIGNAL_STARTRUN 1_bootrr 11137502_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c00dfae2b179a4628ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230725/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c00dfbe2b179a4628ac=
e1d
        new failure (last pass: next-20230719) =

 =20
