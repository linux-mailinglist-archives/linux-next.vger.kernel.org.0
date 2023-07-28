Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA92F766938
	for <lists+linux-next@lfdr.de>; Fri, 28 Jul 2023 11:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbjG1JrU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Jul 2023 05:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbjG1JrR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jul 2023 05:47:17 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C22E26BC
        for <linux-next@vger.kernel.org>; Fri, 28 Jul 2023 02:47:12 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bbc06f830aso12584015ad.0
        for <linux-next@vger.kernel.org>; Fri, 28 Jul 2023 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690537631; x=1691142431;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JHTCOSV0ZVfoRSOqTAPAzppdsyUHgb+OunFR9H8cIcI=;
        b=xqjCJIRt2aMyIseDrvPJ1jt1ANso45wurTx18du9MGwqAGYnmcJszn2W602yr88tko
         7yTq8VAiSxIXIsWjO0Fv4zDuBlpDEYoPMcgZe3zYw1PV2Mgff4UduPx7e3D26bUIfpf3
         I4fHPXpSA/1QPaFYe9bqyRK4jFfE/5GESTi42R07WyEeDSK0YpzOiBoj9Wes7ylueb4f
         /IPxlSF44zL/R6FE5rb+weyrxnpxWKRR0cHUeWJH8TvJTUjfU8zGrNza0LCxm9Yv0buy
         M+d+SDF8zZEBZTHOld9GPTvxziAU3mPu5OZkPIyANpqgkfotbl2TZ/sab+hbunNy4z7K
         jxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537631; x=1691142431;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHTCOSV0ZVfoRSOqTAPAzppdsyUHgb+OunFR9H8cIcI=;
        b=kjJW30AZG8wWIh6jfg55a6H7Wa8xHoRS+P5NulZ9eM56RGKAZYd90orFej5Nzkp49n
         PJmiDZDJ2ftW3n7A6iAEpwCy5pwvLHCpe59lL+iPoJHnMC5H1yw8WQ8TfBIEVxk8KlyC
         SMd+/LwcaUWr49zh6GucvMixa6jvDOBdpK6w6CS58+5SK3aCiz8/DNkXjLz34ppkqMFK
         ejuDubRjmmSErraDJUBCF8E85ahkO6YbonIgy4+P7SWLYrAygbR3IpzSuwTnv6uK2VSc
         U/3J2asJI48/aVex/KjGPRAUCmJ9GCk/3V+x5bUX1eWqFiY1DQVc0l+n0XRFHWf2BtUG
         nrZA==
X-Gm-Message-State: ABy/qLZiWs/ZqC+pHzZ6fUa0xEN+rfxmCHB/Wjds4lLGMhFfcKc0rczU
        EJvvnhgym3urqaOCgluigiSfbSbZx4XFfEJm+/2XgA==
X-Google-Smtp-Source: APBJJlHgQqHpQYU1e4MhI0+x9J/ZlQgOcShnRfYmiTE+kaCzoQeh/CVWCzaUcNsV6+0MffBzFStwJg==
X-Received: by 2002:a17:902:ce8d:b0:1b6:6a14:3734 with SMTP id f13-20020a170902ce8d00b001b66a143734mr1910661plg.29.1690537630425;
        Fri, 28 Jul 2023 02:47:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z8-20020a170903018800b001b8a85489a3sm3139517plg.262.2023.07.28.02.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:47:09 -0700 (PDT)
Message-ID: <64c38e9d.170a0220.6503f.60f6@mx.google.com>
Date:   Fri, 28 Jul 2023 02:47:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230728
X-Kernelci-Report-Type: test
Subject: next/master baseline: 475 runs, 71 regressions (next-20230728)
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

next/master baseline: 475 runs, 71 regressions (next-20230728)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

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
fig                    | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

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

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 22         =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230728/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230728
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d7b3af5a77e8d8da28f435f313e069aea5bcf172 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c369a500ac9153948ace51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c369a500ac9153948ac=
e52
        failing since 72 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c366449828a516518ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c366449828a516518ac=
e1e
        failing since 15 days (last pass: next-20230712, first fail: next-2=
0230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3655992f02389128ace1c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c3655992f02389128ace21
        failing since 121 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-28T06:51:22.869582  <8>[    7.948891] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11157577_1.4.2.3.1>

    2023-07-28T06:51:22.872761  + set +x

    2023-07-28T06:51:22.979983  / # #

    2023-07-28T06:51:23.082513  export SHELL=3D/bin/sh

    2023-07-28T06:51:23.083340  #

    2023-07-28T06:51:23.184862  / # export SHELL=3D/bin/sh. /lava-11157577/=
environment

    2023-07-28T06:51:23.185603  =


    2023-07-28T06:51:23.287320  / # . /lava-11157577/environment/lava-11157=
577/bin/lava-test-runner /lava-11157577/1

    2023-07-28T06:51:23.288410  =


    2023-07-28T06:51:23.294974  / # /lava-11157577/bin/lava-test-runner /la=
va-11157577/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c369b9073c0460128ace29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c369b9073c0460128ac=
e2a
        failing since 72 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36559759dc01d508ace36

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36559759dc01d508ace3b
        failing since 121 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-28T06:50:32.973979  <8>[   10.022770] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11157601_1.4.2.3.1>

    2023-07-28T06:50:32.977481  + set +x

    2023-07-28T06:50:33.083705  =


    2023-07-28T06:50:33.185760  / # #export SHELL=3D/bin/sh

    2023-07-28T06:50:33.186581  =


    2023-07-28T06:50:33.288303  / # export SHELL=3D/bin/sh. /lava-11157601/=
environment

    2023-07-28T06:50:33.289092  =


    2023-07-28T06:50:33.390859  / # . /lava-11157601/environment/lava-11157=
601/bin/lava-test-runner /lava-11157601/1

    2023-07-28T06:50:33.392173  =


    2023-07-28T06:50:33.397256  / # /lava-11157601/bin/lava-test-runner /la=
va-11157601/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c370af654db18b088ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c370af654db18b088ac=
e1e
        failing since 186 days (last pass: next-20230120, first fail: next-=
20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c363d4023bd3b8f08ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c363d4023bd3b8f08ace1f
        failing since 14 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-28T06:44:04.894420  + [   17.962747] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1239322_1.5.2.4.1>
    2023-07-28T06:44:04.894711  set +x
    2023-07-28T06:44:04.999825  =

    2023-07-28T06:44:05.100994  / # #export SHELL=3D/bin/sh
    2023-07-28T06:44:05.101397  =

    2023-07-28T06:44:05.202341  / # export SHELL=3D/bin/sh. /lava-1239322/e=
nvironment
    2023-07-28T06:44:05.202743  =

    2023-07-28T06:44:05.303733  / # . /lava-1239322/environment/lava-123932=
2/bin/lava-test-runner /lava-1239322/1
    2023-07-28T06:44:05.304399  =

    2023-07-28T06:44:05.567833  / # /lava-1239322/bin/lava-test-runner /lav=
a-1239322/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a6ff6a6b306318ace36

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36a6ff6a6b306318ace39
        failing since 14 days (last pass: next-20220831, first fail: next-2=
0230629)

    2023-07-28T07:12:26.316721  + [   13.129088] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1239332_1.5.2.4.1>
    2023-07-28T07:12:26.317017  set +x
    2023-07-28T07:12:26.422803  =

    2023-07-28T07:12:26.524054  / # #export SHELL=3D/bin/sh
    2023-07-28T07:12:26.524491  =

    2023-07-28T07:12:26.625458  / # export SHELL=3D/bin/sh. /lava-1239332/e=
nvironment
    2023-07-28T07:12:26.625900  =

    2023-07-28T07:12:26.726888  / # . /lava-1239332/environment/lava-123933=
2/bin/lava-test-runner /lava-1239332/1
    2023-07-28T07:12:26.727653  =

    2023-07-28T07:12:26.731583  / # /lava-1239332/bin/lava-test-runner /lav=
a-1239332/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3699b00ac9153948ace27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c3699b00ac9153948ac=
e28
        failing since 72 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c369eb1f94a7a7498ace99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c369eb1f94a7a7498ac=
e9a
        failing since 72 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3655ad4c734aa118ace1c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c3655ad4c734aa118ace21
        failing since 121 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-28T06:50:32.491783  + set +x

    2023-07-28T06:50:32.498032  <8>[   10.799787] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11157592_1.4.2.3.1>

    2023-07-28T06:50:32.602035  / # #

    2023-07-28T06:50:32.702620  export SHELL=3D/bin/sh

    2023-07-28T06:50:32.702835  #

    2023-07-28T06:50:32.803432  / # export SHELL=3D/bin/sh. /lava-11157592/=
environment

    2023-07-28T06:50:32.803688  =


    2023-07-28T06:50:32.904204  / # . /lava-11157592/environment/lava-11157=
592/bin/lava-test-runner /lava-11157592/1

    2023-07-28T06:50:32.904477  =


    2023-07-28T06:50:32.908947  / # /lava-11157592/bin/lava-test-runner /la=
va-11157592/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3653a448ee664b88ace59

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c3653a448ee664b88ace5e
        failing since 121 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-28T06:50:24.723692  <8>[   10.147108] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11157579_1.4.2.3.1>

    2023-07-28T06:50:24.727252  + set +x

    2023-07-28T06:50:24.832863  #

    2023-07-28T06:50:24.833103  =


    2023-07-28T06:50:24.933790  / # #export SHELL=3D/bin/sh

    2023-07-28T06:50:24.933993  =


    2023-07-28T06:50:25.034504  / # export SHELL=3D/bin/sh. /lava-11157579/=
environment

    2023-07-28T06:50:25.034671  =


    2023-07-28T06:50:25.135170  / # . /lava-11157579/environment/lava-11157=
579/bin/lava-test-runner /lava-11157579/1

    2023-07-28T06:50:25.135409  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c369d1073c0460128ace38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c369d1073c0460128ac=
e39
        failing since 72 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c365366ed575a8be8acf9f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c365366ed575a8be8acfa4
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:50:21.438182  + set[    5.400053] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 996515_1.5.2.3.1>
    2023-07-28T06:50:21.438389   +x
    2023-07-28T06:50:21.541664  / # #
    2023-07-28T06:50:21.643434  export SHELL=3D/bin/sh
    2023-07-28T06:50:21.643914  #
    2023-07-28T06:50:21.745279  / # xx|<8=EF=BF=BD=EF=BF=BD=EF=BF=BD=D1=81S=
HELL=3D/bin/sh. /lava-996515/environment
    2023-07-28T06:50:21.745766  =

    2023-07-28T06:50:21.847133  / # |=EF=BF=BD=EF=BF=BD<=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD996515/environment/lava-996515/bin/lava-test-runner /lava=
-996515/1
    2023-07-28T06:50:21.847776  =

    2023-07-28T06:50:21.851874  / # =EF=BF=BD|=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDo=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD]=CB=AB=C9=81/lava-996515/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3632e2f504218578ace86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c3632e2f504218578ac=
e87
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c369d240402a3eca8ace4c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c369d240402a3eca8ace51
        new failure (last pass: next-20230726)

    2023-07-28T07:09:47.649114  + set[    5.619895] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 996516_1.5.2.3.1>
    2023-07-28T07:09:47.649313   +x
    2023-07-28T07:09:47.753360  / # #
    2023-07-28T07:09:47.855248  export SHELL=3D/bin/sh
    2023-07-28T07:09:47.855742  #
    2023-07-28T07:09:47.957050  / # 8x=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BDt SHELL=3D/bin/sh. /lava-996516/environment
    2023-07-28T07:09:47.957556  =

    2023-07-28T07:09:48.059081  / # |=EF=BF=BD~=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDz*=EF=BF=BD=D9=A5=EF=BF=BDronment/lava-=
996516/bin/lava-test-runner /lava-996516/1
    2023-07-28T07:09:48.060047  =

    2023-07-28T07:09:48.063176  / # =EF=BF=BD=EF=BF=BD?=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BD=EF=
=BF=BDva-996516/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36f5e50c27483358ace1e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36f5e50c27483358ace23
        new failure (last pass: next-20230725)

    2023-07-28T07:33:43.144903  + set +x
    2023-07-28T07:33:43.145117  [   35.940178][  T174] <LAVA_SIGNAL_ENDRUN =
0_dmesg 996518_1.5.2.3.1>
    2023-07-28T07:33:43.267316  #
    2023-07-28T07:33:43.369095  / # #export SHELL=3D/bin/sh
    2023-07-28T07:33:43.369584  =

    2023-07-28T07:33:43.470896  / # =EF=BF=BD<|=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=7F=EF=BF=BDxport SHELL=3D/bin/sh. /lava-996518/environment
    2023-07-28T07:33:43.471360  =

    2023-07-28T07:33:43.572707  / # =EF=BF=BD=EF=BF=BD|=0E=EF=BF=BD=EF=BF=
=BD. /lava-996518/environment/lava-996518/bin/lava-test-runner /lava-996518=
/1
    2023-07-28T07:33:43.573411  =

    2023-07-28T07:33:43.577159  / # =EF=BF=BD=EF=BF=BD=EF=BF=BD\=EF=BF=BD=
=EF=BF=BD=EF=BF=BDx=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=1E=EF=BF=BD=EF=BF=BD/bin/lava-test-runner /lava=
-996518/1 =

    ... (20 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36585a7b15a49e48ace2a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36585a7b15a49e48ace2f
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:51:23.544802  + set<8>[   22.825323] <LAVA_SIGNAL_ENDRUN =
0_dmesg 15822_1.5.2.4.1>
    2023-07-28T06:51:23.545402   +x
    2023-07-28T06:51:23.654112  #
    2023-07-28T06:51:24.820465  / # #export SHELL=3D/bin/sh
    2023-07-28T06:51:24.826680  =

    2023-07-28T06:51:26.269947  / # export SHELL=3D/bin/sh. /lava-15822/env=
ironment
    2023-07-28T06:51:26.275960  =

    2023-07-28T06:51:28.888210  / # . /lava-15822/environment/lava-15822/bi=
n/lava-test-runner /lava-15822/1
    2023-07-28T06:51:28.895007  =

    2023-07-28T06:51:28.907336  / # /lava-15822/bin/lava-test-runner /lava-=
15822/1 =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c363402f504218578acf4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c363402f504218578acf54
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:44.122651  <8>[   25.424819] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-07-28T06:41:44.123241  + set<8>[   25.434212] <LAVA_SIGNAL_ENDRUN =
0_dmesg 15757_1.5.2.4.1>
    2023-07-28T06:41:44.123625   +x
    2023-07-28T06:41:44.232503  / # #
    2023-07-28T06:41:45.395365  export SHELL=3D/bin/sh
    2023-07-28T06:41:45.401261  #
    2023-07-28T06:41:46.838939  / # export SHELL=3D/bin/sh. /lava-15757/env=
ironment
    2023-07-28T06:41:46.844919  =

    2023-07-28T06:41:49.447751  / # . /lava-15757/environment/lava-15757/bi=
n/lava-test-runner /lava-15757/1
    2023-07-28T06:41:49.454702   =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c363cd2c4b6533918ace2a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c363cd2c4b6533918ace2f
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:44:05.576122  + set<8>[   22.595815] <LAVA_SIGNAL_ENDRUN =
0_dmesg 15794_1.5.2.4.1>
    2023-07-28T06:44:05.576555   +x
    2023-07-28T06:44:05.685415  / ##
    2023-07-28T06:44:06.851278  export SHELL=3D/bin/sh
    2023-07-28T06:44:06.857350   #
    2023-07-28T06:44:08.298489  / # export SHELL=3D/bin/sh. /lava-15794/env=
ironment
    2023-07-28T06:44:08.304508  =

    2023-07-28T06:44:10.917110  / # . /lava-15794/environment/lava-15794/bi=
n/lava-test-runner /lava-15794/1
    2023-07-28T06:44:10.923866  =

    2023-07-28T06:44:10.935943  / # /lava-15794/bin/lava-test-runner /lava-=
15794/1 =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a0e4a087a433c8acebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36a0e4a087a433c8acec0
        new failure (last pass: next-20230726)

    2023-07-28T07:10:51.314293  + set<8>[   21.859313] <LAVA_SIGNAL_ENDRUN =
0_dmesg 15865_1.5.2.4.1>
    2023-07-28T07:10:51.317837   +x
    2023-07-28T07:10:51.423737  / # #
    2023-07-28T07:10:52.589322  export SHELL=3D/bin/sh
    2023-07-28T07:10:52.595437  #
    2023-07-28T07:10:54.038451  / # export SHELL=3D/bin/sh. /lava-15865/env=
ironment
    2023-07-28T07:10:54.044565  =

    2023-07-28T07:10:56.656474  / # . /lava-15865/environment/lava-15865/bi=
n/lava-test-runner /lava-15865/1
    2023-07-28T07:10:56.663227  =

    2023-07-28T07:10:56.677192  / # /lava-15865/bin/lava-test-runner /lava-=
15865/1 =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36b0893cdff32ac8ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36b0893cdff32ac8ac=
e1d
        new failure (last pass: next-20230725) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 22         =


  Details:     https://kernelci.org/test/plan/id/64c363342f504218578ace89

  Results:     27 PASS, 22 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c363342f504218578ace8c
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:18.370775  / # #
    2023-07-28T06:41:18.472829  export SHELL=3D/bin/sh
    2023-07-28T06:41:18.473548  #
    2023-07-28T06:41:18.575113  / # export SHELL=3D/bin/sh. /lava-372560/en=
vironment
    2023-07-28T06:41:18.575850  =

    2023-07-28T06:41:18.677140  / # . /lava-372560/environment/lava-372560/=
bin/lava-test-runner /lava-372560/1
    2023-07-28T06:41:18.678393  =

    2023-07-28T06:41:18.697946  / # /lava-372560/bin/lava-test-runner /lava=
-372560/1
    2023-07-28T06:41:18.738677  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-28T06:41:18.753921  + cd /lava-372560/1/tests/1_bootrr =

    ... (41 line(s) more)  =


  * baseline.bootrr.imx-i2c-i2c0-probed: https://kernelci.org/test/case/id/=
64c363342f504218578ace90
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:20.791051  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:20.794352  <8>[   23.111480] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-i2c-i2c3-probed: https://kernelci.org/test/case/id/=
64c363342f504218578ace91
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:22.782255  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:22.782691  <8>[   25.168992] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c3-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-i2c-i2c3-probed: https://kernelci.org/test/case/id/=
64c363342f504218578ace91
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:22.782255  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:22.782691  <8>[   25.168992] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-i2c-i2c3-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-uart-uart0-probed: https://kernelci.org/test/case/i=
d/64c363342f504218578ace93
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:23.775568  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:23.775992  <8>[   26.220137] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-uart-uart0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-uart-uart2-probed: https://kernelci.org/test/case/i=
d/64c363342f504218578ace95
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:24.809512  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:24.809932  <8>[   27.274759] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-uart-uart2-probed RESULT=3Dfail>
    2023-07-28T06:41:24.810293  /lava-372560/1/../bin/lava-test-case   =


  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/64c363342f504218578ace97
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:24.812923  <8>[   27.297033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dpass>
    2023-07-28T06:41:25.818520  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:25.818941  <8>[   28.326117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2023-07-28T06:41:25.819240  /lava-372560/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/64c=
363342f504218578ace99
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:26.821510  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:26.821936  <8>[   29.377057] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc3-usb0-probed: https://kernelci.org/test/case/id/64c=
363342f504218578ace9b
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:27.809249  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:27.812507  <8>[   30.427458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64c=
363342f504218578ace9c
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:28.822691  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:28.823115  <8>[   31.455886] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-07-28T06:41:28.823413  /lava-372560/1/../bin/lava-test-case   =


  * baseline.bootrr.imx2-wdt-driver-present: https://kernelci.org/test/case=
/id/64c363342f504218578acea0
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:29.858754  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:29.862026  <8>[   32.556062] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx2-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.imx-sdma-0-probed: https://kernelci.org/test/case/id/64=
c363342f504218578acea2
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:31.846235  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:31.849382  <8>[   34.632909] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-sdma-1-probed: https://kernelci.org/test/case/id/64=
c363342f504218578acea3
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:32.860458  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:32.860887  <8>[   35.661408] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-1-probed RESULT=3Dfail>
    2023-07-28T06:41:32.861239  /lava-372560/1/../bin/lava-test-case   =


  * baseline.bootrr.sdhci-esdhc-imx-mmc0-probed: https://kernelci.org/test/=
case/id/64c363342f504218578aceab
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:33.988218  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:33.991548  <8>[   36.859002] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsdhci-esdhc-imx-mmc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.sdhci-esdhc-imx-mmc1-probed: https://kernelci.org/test/=
case/id/64c363342f504218578aceac
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:34.975989  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:34.979125  <8>[   37.888196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsdhci-esdhc-imx-mmc1-probed RESULT=3Dfail>
    2023-07-28T06:41:34.979318  /lava-372560/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/64c363342f504218578aceae
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:36.007518  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:36.007940  <8>[   38.939628] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>
    2023-07-28T06:41:36.008231  /lava-372560/1/../bin/lava-test-case   =


  * baseline.bootrr.reset-imx7-probed: https://kernelci.org/test/case/id/64=
c363342f504218578aceb0
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:36.010833  <8>[   38.961741] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dreset-imx7-driver-present RESULT=3Dpass>
    2023-07-28T06:41:37.016451  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:37.016866  <8>[   39.990756] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dreset-imx7-probed RESULT=3Dfail>
    2023-07-28T06:41:37.017176  /lava-372560/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl-quadspi-spi0-probed: https://kernelci.org/test/case=
/id/64c363342f504218578aceb2
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:38.025694  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:38.026151  <8>[   41.041859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl-quadspi-spi0-probed RESULT=3Dfail>   =


  * baseline.bootrr.pmic-pfuze100-probed: https://kernelci.org/test/case/id=
/64c363342f504218578aceb4
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:39.013744  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:39.016970  <8>[   42.093240] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpmic-pfuze100-probed RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/64c363342f504218578aceb5
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:39.975911  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:39.998103  <8>[   43.118015] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
64c363342f504218578aceb6
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:40.977277  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:40.980570  <8>[   44.143311] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dblocked>
    2023-07-28T06:41:41.965308  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:41.968581  <8>[   45.168382] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.spi-nor-probed: https://kernelci.org/test/case/id/64c36=
3342f504218578aceb8
        failing since 1 day (last pass: next-20230726, first fail: next-202=
30727)

    2023-07-28T06:41:43.965592  /lava-372560/1/../bin/lava-test-case
    2023-07-28T06:41:43.966011  <8>[   47.243806] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dspi-nor-probed RESULT=3Dfail>
    2023-07-28T06:41:43.966361  + set<8>[   47.254279] <LAVA_SIGNAL_ENDRUN =
1_bootrr 372560_1.5.2.4.5>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64c369a2853db416de8ace37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c369a2853db416de8ac=
e38
        failing since 72 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35c7a67b28eb7468ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c35c7a67b28eb7468ac=
e1d
        failing since 1 day (last pass: next-20230721, first fail: next-202=
30726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64c363a70450601a698acef1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c363a70450601a698ac=
ef2
        new failure (last pass: next-20230726) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36afb9d600b7c678ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36afb9d600b7c678ac=
e1d
        failing since 317 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a3cac8a1ef57a8ace1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36a3cac8a1ef57a8ac=
e20
        failing since 317 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36b4b93cdff32ac8ace33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36b4b93cdff32ac8ac=
e34
        failing since 315 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a39d901097ba88ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36a39d901097ba88ac=
e1f
        failing since 315 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36b4d331d3fb9c68ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36b4d331d3fb9c68ac=
e1f
        failing since 315 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a3ed901097ba88ace35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36a3ed901097ba88ac=
e36
        failing since 315 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36b0f93cdff32ac8ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36b0f93cdff32ac8ac=
e23
        failing since 317 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a3dac8a1ef57a8ace25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c36a3dac8a1ef57a8ac=
e26
        failing since 317 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c37074d074ed234b8ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c37074d074ed234b8ac=
e1f
        new failure (last pass: next-20230725) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3703ed19fa765438ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c3703ed19fa765438ac=
e1d
        new failure (last pass: next-20230725) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35d323bf003c4da8ace3e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c35d323bf003c4da8ace41
        failing since 10 days (last pass: next-20230710, first fail: next-2=
0230717)

    2023-07-28T06:15:51.528734  / # #
    2023-07-28T06:15:52.992337  export SHELL=3D/bin/sh
    2023-07-28T06:15:53.012926  #
    2023-07-28T06:15:53.013135  / # export SHELL=3D/bin/sh
    2023-07-28T06:15:54.899410  / # . /lava-989946/environment
    2023-07-28T06:15:58.358392  /lava-989946/bin/lava-test-runner /lava-989=
946/1
    2023-07-28T06:15:58.379174  . /lava-989946/environment
    2023-07-28T06:15:58.379283  / # /lava-989946/bin/lava-test-runner /lava=
-989946/1
    2023-07-28T06:15:58.425419  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-28T06:15:58.462014  + cd /lava-989946/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c365ca3e476474778ace7d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c365ca3e476474778ace80
        failing since 10 days (last pass: next-20230713, first fail: next-2=
0230717)

    2023-07-28T06:52:33.203584  / # #
    2023-07-28T06:52:34.666241  export SHELL=3D/bin/sh
    2023-07-28T06:52:34.686769  #
    2023-07-28T06:52:34.686970  / # export SHELL=3D/bin/sh
    2023-07-28T06:52:36.572463  / # . /lava-989977/environment
    2023-07-28T06:52:40.031240  /lava-989977/bin/lava-test-runner /lava-989=
977/1
    2023-07-28T06:52:40.052026  . /lava-989977/environment
    2023-07-28T06:52:40.052138  / # /lava-989977/bin/lava-test-runner /lava=
-989977/1
    2023-07-28T06:52:40.144667  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-28T06:52:40.144885  + cd /lava-989977/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c363ae88401cacdb8ace1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c363ae88401cacdb8ace1f
        failing since 10 days (last pass: next-20230713, first fail: next-2=
0230717)

    2023-07-28T06:43:41.841514  / # #
    2023-07-28T06:43:43.304385  export SHELL=3D/bin/sh
    2023-07-28T06:43:43.324953  #
    2023-07-28T06:43:43.325156  / # export SHELL=3D/bin/sh
    2023-07-28T06:43:45.210672  / # . /lava-989960/environment
    2023-07-28T06:43:48.669151  /lava-989960/bin/lava-test-runner /lava-989=
960/1
    2023-07-28T06:43:48.689891  . /lava-989960/environment
    2023-07-28T06:43:48.690002  / # /lava-989960/bin/lava-test-runner /lava=
-989960/1
    2023-07-28T06:43:48.772765  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-28T06:43:48.772981  + cd /lava-989960/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36517e812067aa98ace88

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36517e812067aa98ace8b
        failing since 2 days (last pass: next-20230710, first fail: next-20=
230725)

    2023-07-28T06:49:44.846551  / # #
    2023-07-28T06:49:46.309242  export SHELL=3D/bin/sh
    2023-07-28T06:49:46.329787  #
    2023-07-28T06:49:46.329995  / # export SHELL=3D/bin/sh
    2023-07-28T06:49:48.215230  / # . /lava-989967/environment
    2023-07-28T06:49:51.673771  /lava-989967/bin/lava-test-runner /lava-989=
967/1
    2023-07-28T06:49:51.694806  . /lava-989967/environment
    2023-07-28T06:49:51.694942  / # /lava-989967/bin/lava-test-runner /lava=
-989967/1
    2023-07-28T06:49:51.777112  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-28T06:49:51.777358  + cd /lava-989967/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a2d2447280b8e8ace49

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36a2d2447280b8e8ace4c
        failing since 8 days (last pass: next-20230714, first fail: next-20=
230719)

    2023-07-28T07:11:27.596870  / # #
    2023-07-28T07:11:29.056122  export SHELL=3D/bin/sh
    2023-07-28T07:11:29.076534  #
    2023-07-28T07:11:29.076651  / # export SHELL=3D/bin/sh
    2023-07-28T07:11:30.958592  / # . /lava-989983/environment
    2023-07-28T07:11:34.411016  /lava-989983/bin/lava-test-runner /lava-989=
983/1
    2023-07-28T07:11:34.431615  . /lava-989983/environment
    2023-07-28T07:11:34.431745  / # /lava-989983/bin/lava-test-runner /lava=
-989983/1
    2023-07-28T07:11:34.509465  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-28T07:11:34.509596  + cd /lava-989983/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36580dafd90de598ace77

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36580dafd90de598ace7c
        failing since 10 days (last pass: next-20230713, first fail: next-2=
0230717)

    2023-07-28T06:51:43.479312  / # #

    2023-07-28T06:51:44.559495  export SHELL=3D/bin/sh

    2023-07-28T06:51:44.561382  #

    2023-07-28T06:51:46.052590  / # export SHELL=3D/bin/sh. /lava-11157633/=
environment

    2023-07-28T06:51:46.054488  =


    2023-07-28T06:51:48.779928  / # . /lava-11157633/environment/lava-11157=
633/bin/lava-test-runner /lava-11157633/1

    2023-07-28T06:51:48.782174  =


    2023-07-28T06:51:48.785308  / # /lava-11157633/bin/lava-test-runner /la=
va-11157633/1

    2023-07-28T06:51:48.849387  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:51:48.849873  + cd /lav<8>[   29.503316] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11157633_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c363508c4845b3ff8ace7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c363508c4845b3ff8ace7f
        failing since 10 days (last pass: next-20230713, first fail: next-2=
0230717)

    2023-07-28T06:42:34.703259  / # #

    2023-07-28T06:42:35.782473  export SHELL=3D/bin/sh

    2023-07-28T06:42:35.784274  #

    2023-07-28T06:42:37.274415  / # export SHELL=3D/bin/sh. /lava-11157512/=
environment

    2023-07-28T06:42:37.276297  =


    2023-07-28T06:42:39.999683  / # . /lava-11157512/environment/lava-11157=
512/bin/lava-test-runner /lava-11157512/1

    2023-07-28T06:42:40.001838  =


    2023-07-28T06:42:40.012156  / # /lava-11157512/bin/lava-test-runner /la=
va-11157512/1

    2023-07-28T06:42:40.071412  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:42:40.071925  + cd /lava-111575<8>[   28.538350] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11157512_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36378d64df3cba58ace34

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36378d64df3cba58ace39
        failing since 2 days (last pass: next-20230710, first fail: next-20=
230725)

    2023-07-28T06:42:57.384822  / # #

    2023-07-28T06:42:58.465397  export SHELL=3D/bin/sh

    2023-07-28T06:42:58.467175  #

    2023-07-28T06:42:59.957864  / # export SHELL=3D/bin/sh. /lava-11157551/=
environment

    2023-07-28T06:42:59.959751  =


    2023-07-28T06:43:02.685309  / # . /lava-11157551/environment/lava-11157=
551/bin/lava-test-runner /lava-11157551/1

    2023-07-28T06:43:02.687464  =


    2023-07-28T06:43:02.690603  / # /lava-11157551/bin/lava-test-runner /la=
va-11157551/1

    2023-07-28T06:43:02.758161  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:43:02.758694  + cd /lava-<8>[   28.524076] <LAVA_SIGNAL_S=
TARTRUN 1_bootrr 11157551_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36a122447280b8e8ace22

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36a122447280b8e8ace27
        failing since 8 days (last pass: next-20230714, first fail: next-20=
230719)

    2023-07-28T07:10:57.165682  / # #

    2023-07-28T07:10:58.244826  export SHELL=3D/bin/sh

    2023-07-28T07:10:58.246658  #

    2023-07-28T07:10:59.736748  / # export SHELL=3D/bin/sh. /lava-11157742/=
environment

    2023-07-28T07:10:59.738604  =


    2023-07-28T07:11:02.462429  / # . /lava-11157742/environment/lava-11157=
742/bin/lava-test-runner /lava-11157742/1

    2023-07-28T07:11:02.464727  =


    2023-07-28T07:11:02.473379  / # /lava-11157742/bin/lava-test-runner /la=
va-11157742/1

    2023-07-28T07:11:02.532405  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T07:11:02.532905  + cd /lav<8>[   28.524669] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11157742_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64c36fb3b2fae0baab8ace2e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c36fb3b2fae0baab8ace33
        failing since 2 days (last pass: next-20230712, first fail: next-20=
230725)

    2023-07-28T07:35:12.367347  + set +x

    2023-07-28T07:35:12.367420  <8>[   35.469660][  T220] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11157804_1.5.2.4.1>

    2023-07-28T07:35:12.484459  / # #

    2023-07-28T07:35:13.558990  export SHELL=3D/bin/sh

    2023-07-28T07:35:13.560779  #

    2023-07-28T07:35:15.050819  / # export SHELL=3D/bin/sh. /lava-11157804/=
environment

    2023-07-28T07:35:15.052754  =


    2023-07-28T07:35:17.775660  / # . /lava-11157804/environment/lava-11157=
804/bin/lava-test-runner /lava-11157804/1

    2023-07-28T07:35:17.778072  =


    2023-07-28T07:35:17.782317  / # /lava-11157804/bin/lava-test-runner /la=
va-11157804/1
 =

    ... (40 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64c35dcb14f380c7538ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c35dcb14f380c7538ac=
e1d
        new failure (last pass: next-20230727) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3655bdafd90de598ace53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c3655bdafd90de598ace58
        failing since 10 days (last pass: next-20230713, first fail: next-2=
0230717)

    2023-07-28T06:52:37.442086  / # #

    2023-07-28T06:52:37.544094  export SHELL=3D/bin/sh

    2023-07-28T06:52:37.544788  #

    2023-07-28T06:52:37.646200  / # export SHELL=3D/bin/sh. /lava-11157625/=
environment

    2023-07-28T06:52:37.646921  =


    2023-07-28T06:52:37.748337  / # . /lava-11157625/environment/lava-11157=
625/bin/lava-test-runner /lava-11157625/1

    2023-07-28T06:52:37.749433  =


    2023-07-28T06:52:37.752042  / # /lava-11157625/bin/lava-test-runner /la=
va-11157625/1

    2023-07-28T06:52:37.839956  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:52:37.840422  + cd /lava-1115762<8>[   16.996248] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11157625_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64c3633f2f504218578acefe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c3633f2f504218578acf03
        failing since 2 days (last pass: next-20230710, first fail: next-20=
230725)

    2023-07-28T06:43:38.200197  / # #

    2023-07-28T06:43:38.300744  export SHELL=3D/bin/sh

    2023-07-28T06:43:38.300871  #

    2023-07-28T06:43:38.401375  / # export SHELL=3D/bin/sh. /lava-11157545/=
environment

    2023-07-28T06:43:38.401494  =


    2023-07-28T06:43:38.502017  / # . /lava-11157545/environment/lava-11157=
545/bin/lava-test-runner /lava-11157545/1

    2023-07-28T06:43:38.502199  =


    2023-07-28T06:43:38.513893  / # /lava-11157545/bin/lava-test-runner /la=
va-11157545/1

    2023-07-28T06:43:38.586707  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:43:38.586783  + cd /lava-11157545/1/tests/1_boot<8>[   17=
.235820] <LAVA_SIGNAL_STARTRUN 1_bootrr 11157545_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64c363548c4845b3ff8acec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230728/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c363548c4845b3ff8acec6
        failing since 10 days (last pass: next-20230713, first fail: next-2=
0230717)

    2023-07-28T06:43:57.684973  / # #

    2023-07-28T06:43:57.786814  export SHELL=3D/bin/sh

    2023-07-28T06:43:57.787013  #

    2023-07-28T06:43:57.887577  / # export SHELL=3D/bin/sh. /lava-11157525/=
environment

    2023-07-28T06:43:57.887783  =


    2023-07-28T06:43:57.988646  / # . /lava-11157525/environment/lava-11157=
525/bin/lava-test-runner /lava-11157525/1

    2023-07-28T06:43:57.989691  =


    2023-07-28T06:43:57.999033  / # /lava-11157525/bin/lava-test-runner /la=
va-11157525/1

    2023-07-28T06:43:58.045345  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-28T06:43:58.073030  + cd /lava-11157525/1/tests/1_boot<8>[   16=
.945766] <LAVA_SIGNAL_STARTRUN 1_bootrr 11157525_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
