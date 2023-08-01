Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A6D76A7A2
	for <lists+linux-next@lfdr.de>; Tue,  1 Aug 2023 05:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjHADsH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 23:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjHADsG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 23:48:06 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91318F1
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 20:48:04 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8b2886364so31827615ad.0
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 20:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690861684; x=1691466484;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hw+Mrrvkkrnu/6BzGxI39FQ5AKY4Mby0T17OrwoX0RA=;
        b=dqTLuD08/jcrVe5EuAMc1h/gxF0g3EuJ+Z+jim8RT9VVEdOwEKs/xw+o8WzGNgAj3y
         PoaskO2JHvGgWRBpY/BSQpgA81/Q86uGfQNr8vvei+eR8IjE4dztvWDmCfIGnPBRHpDT
         iCswRxsjTnzwmFN2kyXb8Y5g4m/45VySdYy/G38fgraYwd8bTPuslItVVIA/4hdfhbd0
         jskO/Gpt1Tnf9A+Fg9w6dRWRHsGMd5Pd/XfqNKouOmDv0LCglX6VqvZ5+WrVVkjM0T3O
         7/K/WwA0IR50wKiSI+DFMXJ4ZTfUcejd07lxC5KXIfyVa6p9WDVFXpd8GUbkxvnYhiB7
         82+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690861684; x=1691466484;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw+Mrrvkkrnu/6BzGxI39FQ5AKY4Mby0T17OrwoX0RA=;
        b=NhmIia4IStRvha3WSkddu/IuJ85oKFYgRaTknyNYigti6CYEdL/ch1xhiGvLRFVlnY
         r/VPmI9NVrTnwyW9yDnfpBSUyR4UGG4s76XhcpvvxBqdICIxmGkqoQy9POYP1r6JIT0U
         4bPwKueheXmHVz9tIWcoT7gXXRTYrVMe5nqRoMg30OkxEpQefs7k46I+oS4rJ6fez6uo
         lN+ZtTFyzKirYoLQMS+GABx/k3OM0nbKZHXEWKbBIElLU6yrqGYSN/q9nzPgdocechVW
         qMm9WzhYMCZPwps8N3RtPYkKJosnIAX7GmHcNtMye6F9iJucESNa0l7hbq20XbqQx3Un
         dJLA==
X-Gm-Message-State: ABy/qLZ1y6WobhuiT1N4GGeU3ACh29cnYGV6JaODH+0ok1tfSCETjvX7
        PSLxIH5sbKt8tWI9TTKvy8sfgZpSBGtyoiE8V64h3w==
X-Google-Smtp-Source: APBJJlFnm4F2bQjYofs81MIzZ6oEKjOzOJFH0WbKpgDP+6zszV2KDM0RW4dpVJEbvb9xgrtATX4eeg==
X-Received: by 2002:a17:902:a601:b0:1b8:5b70:2988 with SMTP id u1-20020a170902a60100b001b85b702988mr9253563plq.30.1690861683607;
        Mon, 31 Jul 2023 20:48:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001b9be3b94d3sm9281566plh.140.2023.07.31.20.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 20:48:02 -0700 (PDT)
Message-ID: <64c88072.170a0220.9a942.2640@mx.google.com>
Date:   Mon, 31 Jul 2023 20:48:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc4-220-gd08ef24947110
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 53 runs,
 5 regressions (v6.5-rc4-220-gd08ef24947110)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 53 runs, 5 regressions (v6.5-rc4-220-gd08ef249=
47110)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
fsl-ls2088a-rdb    | arm64 | lab-nxp       | gcc-10   | defconfig | 1      =
    =

r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =

r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc4-220-gd08ef24947110/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc4-220-gd08ef24947110
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d08ef24947110c3528df7902eed86276d39c6eb1 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
fsl-ls2088a-rdb    | arm64 | lab-nxp       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64c84bd2e93d15eb498ace83

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c84bd2e93d15eb498ace86
        failing since 17 days (last pass: v6.0-rc4-326-g49ccb7c6c3ca, first=
 fail: v6.4-11141-g4556f2dbce0d)

    2023-08-01T00:03:08.253530  [   13.147294] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1239786_1.5.2.4.1>
    2023-08-01T00:03:08.358857  =

    2023-08-01T00:03:08.459992  / # #export SHELL=3D/bin/sh
    2023-08-01T00:03:08.460704  =

    2023-08-01T00:03:08.561946  / # export SHELL=3D/bin/sh. /lava-1239786/e=
nvironment
    2023-08-01T00:03:08.562330  =

    2023-08-01T00:03:08.663108  / # . /lava-1239786/environment/lava-123978=
6/bin/lava-test-runner /lava-1239786/1
    2023-08-01T00:03:08.663802  =

    2023-08-01T00:03:08.667845  / # /lava-1239786/bin/lava-test-runner /lav=
a-1239786/1
    2023-08-01T00:03:08.690631  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a774c0-ek874     | arm64 | lab-cip       | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64c84becb0906dacfd8ace1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c84becb0906dacfd8ace20
        failing since 13 days (last pass: v6.5-rc1-374-g7758824d54f7, first=
 fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-08-01T00:03:45.342025  / # #
    2023-08-01T00:03:46.801098  export SHELL=3D/bin/sh
    2023-08-01T00:03:46.821569  #
    2023-08-01T00:03:46.821722  / # export SHELL=3D/bin/sh
    2023-08-01T00:03:48.703130  / # . /lava-991039/environment
    2023-08-01T00:03:52.153220  /lava-991039/bin/lava-test-runner /lava-991=
039/1
    2023-08-01T00:03:52.173816  . /lava-991039/environment
    2023-08-01T00:03:52.173933  / # /lava-991039/bin/lava-test-runner /lava=
-991039/1
    2023-08-01T00:03:52.256929  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-01T00:03:52.257048  + cd /lava-991039/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a77960-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64c84b9291e31684198ace1c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulc=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulc=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c84b9291e31684198ace21
        failing since 13 days (last pass: v6.5-rc1-374-g7758824d54f7, first=
 fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-08-01T00:03:46.254145  / # #

    2023-08-01T00:03:46.355112  export SHELL=3D/bin/sh

    2023-08-01T00:03:46.355851  #

    2023-08-01T00:03:46.457275  / # export SHELL=3D/bin/sh. /lava-11179116/=
environment

    2023-08-01T00:03:46.457999  =


    2023-08-01T00:03:46.559450  / # . /lava-11179116/environment/lava-11179=
116/bin/lava-test-runner /lava-11179116/1

    2023-08-01T00:03:46.560567  =


    2023-08-01T00:03:46.567761  / # /lava-11179116/bin/lava-test-runner /la=
va-11179116/1

    2023-08-01T00:03:46.627165  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-01T00:03:46.627684  + cd /lava-111791<8>[   19.386085] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11179116_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
r8a779m1-ulcb      | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64c84babe93d15eb498ace29

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulc=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c84babe93d15eb498ace2e
        failing since 13 days (last pass: v6.5-rc1-374-g7758824d54f7, first=
 fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-08-01T00:03:06.744853  / # #

    2023-08-01T00:03:07.825351  export SHELL=3D/bin/sh

    2023-08-01T00:03:07.827149  #

    2023-08-01T00:03:09.317831  / # export SHELL=3D/bin/sh. /lava-11179110/=
environment

    2023-08-01T00:03:09.319720  =


    2023-08-01T00:03:12.044632  / # . /lava-11179110/environment/lava-11179=
110/bin/lava-test-runner /lava-11179110/1

    2023-08-01T00:03:12.046951  =


    2023-08-01T00:03:12.051067  / # /lava-11179110/bin/lava-test-runner /la=
va-11179110/1

    2023-08-01T00:03:12.116805  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-01T00:03:12.117315  + cd /lava-111791<8>[   28.492951] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11179110_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/64c84b91870f96cfe58ace33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc4-22=
0-gd08ef24947110/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c84b91870f96cfe58ace38
        failing since 13 days (last pass: v6.5-rc1-374-g7758824d54f7, first=
 fail: v6.5-rc2-246-gefabeaa08ef1)

    2023-08-01T00:04:00.038213  / # #

    2023-08-01T00:04:00.140390  export SHELL=3D/bin/sh

    2023-08-01T00:04:00.141140  #

    2023-08-01T00:04:00.242603  / # export SHELL=3D/bin/sh. /lava-11179111/=
environment

    2023-08-01T00:04:00.243308  =


    2023-08-01T00:04:00.344786  / # . /lava-11179111/environment/lava-11179=
111/bin/lava-test-runner /lava-11179111/1

    2023-08-01T00:04:00.345959  =


    2023-08-01T00:04:00.362345  / # /lava-11179111/bin/lava-test-runner /la=
va-11179111/1

    2023-08-01T00:04:00.431338  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-01T00:04:00.431845  + cd /lava-11179111/1/tests/1_bootrr
 =

    ... (11 line(s) more)  =

 =20
