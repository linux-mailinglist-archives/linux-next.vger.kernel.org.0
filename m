Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0445D786CD7
	for <lists+linux-next@lfdr.de>; Thu, 24 Aug 2023 12:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbjHXKbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Aug 2023 06:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235789AbjHXKao (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2023 06:30:44 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194301996
        for <linux-next@vger.kernel.org>; Thu, 24 Aug 2023 03:30:40 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686be3cbea0so547844b3a.0
        for <linux-next@vger.kernel.org>; Thu, 24 Aug 2023 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692873039; x=1693477839;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ihfmfut+EpiEU2GdtAgjdQnw0lWa2og9a0IeIC9zm/c=;
        b=XRE3AXLLo1/gNz5eU5c6b4qSjLg4LdsgDKoDqivApOZRSsTSuQSdudB8Q37c2DI9mg
         48RxE4ANGy4Xf6IWrWLJTK5qmq+WMW1kDcRmdqY8bNWGql+X9ZM7Uw/tFrnBnLVvSosD
         VpvpMw7KZLKSIZc7Qb9dtzBgtbW4Flv5ofy4iFijxPKzew+X+39RWgSSgilghB5F7vsC
         HZ/uyx39aT3OsAnO1gT2BuWEuV63U6bzzcj8FSVUrZZFPg7kZmQfj4/mzZtm8IGyFzKd
         IVItAcnl/04xq+e6Ngh+mReMvn00iBRedupXLqmImBfP2oUbl4oUb9n39ndWxHiK3do8
         tBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873039; x=1693477839;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihfmfut+EpiEU2GdtAgjdQnw0lWa2og9a0IeIC9zm/c=;
        b=Pa7lKvH+UhqkP62RP9GeLA8kYFfaNtKld2gQrHeo2PreBzwVL9ql7jbGKxtCYlhAOH
         buh23ABBspDnSRiMaK8H+gWcStVINjysUzSar1fIFr+CEFbwR2ot/jj5RZB3Xyg0cVZp
         pMbw6r1iTgyslaOzVI51gM5ccYJX+L7iBJ1fnsKQc8W26U32+E/bWNq3JJsmtf/3XW9+
         DHNqODCA3+lg5+OzmZOSvUDdMQGjm/42aCg7ISh8+GH9XiBja4NUMGPjvVgx1KuzhL2u
         9q6LDp05naWTY+qvPsnl7gXtm2DnC8TPdKHQERKoIvWRD0WzA7RUj3OhMf6UFsZsz1le
         B7Vw==
X-Gm-Message-State: AOJu0YxGEKCcfl7cMyhtr9OzVXgo5LDosx/sDamJcAXkGyeRowkynTXc
        vMZzO7TGf5eIm5fqkkpDTV3TB0PyUCQ2mWBZv8s=
X-Google-Smtp-Source: AGHT+IFtnRbFs+0xuwRGBEKDNYiue4T+28w914goLyUQYZA5tL/QfP+ok/1oHDUrNc2aEmeumrTZ2g==
X-Received: by 2002:a05:6a20:8f0e:b0:149:bab6:415e with SMTP id b14-20020a056a208f0e00b00149bab6415emr9939445pzk.15.1692873038844;
        Thu, 24 Aug 2023 03:30:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p2-20020a63b802000000b0056c52d25771sm4611285pge.69.2023.08.24.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 03:30:38 -0700 (PDT)
Message-ID: <64e7314e.630a0220.25ff0.a2f9@mx.google.com>
Date:   Thu, 24 Aug 2023 03:30:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230824
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 361 runs, 22 regressions (next-20230824)
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

next/master baseline: 361 runs, 22 regressions (next-20230824)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

k3-j721e-beagleboneai64      | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230824/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230824
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2b3bd393093b04d4882152398019cbb96b0440ff =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f654bb6535c5c9b1e3b0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f654bb6535c5c9b1e3b5
        failing since 8 days (last pass: next-20230807, first fail: next-20=
230815)

    2023-08-24T06:18:31.058775  + set<8>[   27.983513] <LAVA_SIGNAL_ENDRUN =
0_dmesg 67633_1.5.2.4.1>
    2023-08-24T06:18:31.059368   +x
    2023-08-24T06:18:31.167871  / # #
    2023-08-24T06:18:32.332464  export SHELL=3D/bin/sh
    2023-08-24T06:18:32.338514  #
    2023-08-24T06:18:33.779828  / # export SHELL=3D/bin/sh. /lava-67633/env=
ironment
    2023-08-24T06:18:33.786078  =

    2023-08-24T06:18:36.394496  / # . /lava-67633/environment/lava-67633/bi=
n/lava-test-runner /lava-67633/1
    2023-08-24T06:18:36.400861  =

    2023-08-24T06:18:36.417214  / # /lava-67633/bin/lava-test-runner /lava-=
67633/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f6f3a6fc6f0848b1e3c5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f6f3a6fc6f0848b1e3ca
        failing since 8 days (last pass: next-20230807, first fail: next-20=
230815)

    2023-08-24T06:21:22.410034  + set<8>[   29.734267] <LAVA_SIGNAL_ENDRUN =
0_dmesg 67639_1.5.2.4.1>
    2023-08-24T06:21:22.410318   +x
    2023-08-24T06:21:22.516264  / # #
    2023-08-24T06:21:23.680379  export SHELL=3D/bin/sh
    2023-08-24T06:21:23.686536  #
    2023-08-24T06:21:25.128620  / # export SHELL=3D/bin/sh. /lava-67639/env=
ironment
    2023-08-24T06:21:25.134686  =

    2023-08-24T06:21:27.746773  / # . /lava-67639/environment/lava-67639/bi=
n/lava-test-runner /lava-67639/1
    2023-08-24T06:21:27.753556  =

    2023-08-24T06:21:27.770801  / # /lava-67639/bin/lava-test-runner /lava-=
67639/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f382f6d673241bb1e3b4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f382f6d673241bb1e3b9
        failing since 8 days (last pass: next-20230809, first fail: next-20=
230815)

    2023-08-24T06:06:39.795252  + set<8>[   24.885637] <LAVA_SIGNAL_ENDRUN =
0_dmesg 67563_1.5.2.4.1>
    2023-08-24T06:06:39.795423   +x
    2023-08-24T06:06:39.901411  / # #
    2023-08-24T06:06:41.060798  export SHELL=3D/bin/sh
    2023-08-24T06:06:41.066330  #
    2023-08-24T06:06:42.503139  / # export SHELL=3D/bin/sh. /lava-67563/env=
ironment
    2023-08-24T06:06:42.508852  =

    2023-08-24T06:06:45.109365  / # . /lava-67563/environment/lava-67563/bi=
n/lava-test-runner /lava-67563/1
    2023-08-24T06:06:45.115028  =

    2023-08-24T06:06:45.124628  / # /lava-67563/bin/lava-test-runner /lava-=
67563/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f59f510d1415c7b1e3f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f59f510d1415c7b1e3f9
        failing since 8 days (last pass: next-20230809, first fail: next-20=
230815)

    2023-08-24T06:15:37.561728  + set<8>[   27.105207] <LAVA_SIGNAL_ENDRUN =
0_dmesg 67604_1.5.2.4.1>
    2023-08-24T06:15:37.562319   +x
    2023-08-24T06:15:37.671065  / # #
    2023-08-24T06:15:38.837075  export SHELL=3D/bin/sh
    2023-08-24T06:15:38.843168  #
    2023-08-24T06:15:40.286506  / # export SHELL=3D/bin/sh. /lava-67604/env=
ironment
    2023-08-24T06:15:40.292542  =

    2023-08-24T06:15:42.904553  / # . /lava-67604/environment/lava-67604/bi=
n/lava-test-runner /lava-67604/1
    2023-08-24T06:15:42.911330  =

    2023-08-24T06:15:42.920708  / # /lava-67604/bin/lava-test-runner /lava-=
67604/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6fd9820765bbc56b1e480

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6fd9820765bbc56b1e485
        failing since 8 days (last pass: next-20230809, first fail: next-20=
230815)

    2023-08-24T06:49:47.844254  + set<8>[   28.006450] <LAVA_SIGNAL_ENDRUN =
0_dmesg 67723_1.5.2.4.1>
    2023-08-24T06:49:47.844882   +x
    2023-08-24T06:49:47.953301  / # #
    2023-08-24T06:49:49.119279  export SHELL=3D/bin/sh
    2023-08-24T06:49:49.125345  #
    2023-08-24T06:49:50.568549  / # export SHELL=3D/bin/sh. /lava-67723/env=
ironment
    2023-08-24T06:49:50.574761  =

    2023-08-24T06:49:53.186735  / # . /lava-67723/environment/lava-67723/bi=
n/lava-test-runner /lava-67723/1
    2023-08-24T06:49:53.193552  =

    2023-08-24T06:49:53.197324  / # /lava-67723/bin/lava-test-runner /lava-=
67723/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-beagleboneai64      | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f3994f3dad77bfb1e3b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f3994f3dad77bfb1e=
3b4
        new failure (last pass: next-20230822) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f68bbb6535c5c9b1e412

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f68bbb6535c5c9b1e=
413
        failing since 22 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f341b41dc9d484b1e3bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f341b41dc9d484b1e=
3c0
        failing since 23 days (last pass: next-20230728, first fail: next-2=
0230801) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6fe6ef94624743ab1e3b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6fe6ef94624743ab1e=
3ba
        new failure (last pass: next-20230823) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f3a869811c3efbb1e3f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f3a869811c3efbb1e=
3f6
        failing since 197 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f3a969811c3efbb1e3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f3a969811c3efbb1e=
3f9
        failing since 211 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f3b8bfc7bdaab4b1e3b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f3b8bfc7bdaab4b1e=
3b1
        failing since 211 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f3b27b15dc6354b1e405

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f3b27b15dc6354b1e=
406
        failing since 211 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f3329dcf074670b1e3cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f3329dcf074670b1e=
3ce
        failing since 197 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f37fa4262c7238b1e3e1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f37fa4262c7238b1e3e4
        failing since 23 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-08-24T06:06:24.759552  + set +x
    2023-08-24T06:06:24.760117  <8>[   28.416708] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1000075_1.5.2.4.1>
    2023-08-24T06:06:24.868841  / # #
    2023-08-24T06:06:26.339524  export SHELL=3D/bin/sh
    2023-08-24T06:06:26.360912  #
    2023-08-24T06:06:26.361542  / # export SHELL=3D/bin/sh
    2023-08-24T06:06:28.327218  / # . /lava-1000075/environment
    2023-08-24T06:06:31.943125  /lava-1000075/bin/lava-test-runner /lava-10=
00075/1
    2023-08-24T06:06:31.965107  . /lava-1000075/environment
    2023-08-24T06:06:31.965552  / # /lava-1000075/bin/lava-test-runner /lav=
a-1000075/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f728b202c81d58b1e3bd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f728b202c81d58b1e3c0
        failing since 28 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-24T06:22:12.452289  / # #
    2023-08-24T06:22:13.914741  export SHELL=3D/bin/sh
    2023-08-24T06:22:13.935319  #
    2023-08-24T06:22:13.935526  / # export SHELL=3D/bin/sh
    2023-08-24T06:22:15.891383  / # . /lava-1000091/environment
    2023-08-24T06:22:19.487005  /lava-1000091/bin/lava-test-runner /lava-10=
00091/1
    2023-08-24T06:22:19.507580  . /lava-1000091/environment
    2023-08-24T06:22:19.507688  / # /lava-1000091/bin/lava-test-runner /lav=
a-1000091/1
    2023-08-24T06:22:19.599119  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-24T06:22:19.599246  + cd /lava-1000091/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a779m1-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f6114bb5d1f6a1b1e3df

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f6114bb5d1f6a1b1e3e4
        failing since 28 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-24T06:17:46.786294  / # #

    2023-08-24T06:17:47.866297  export SHELL=3D/bin/sh

    2023-08-24T06:17:47.868265  #

    2023-08-24T06:17:49.358252  / # export SHELL=3D/bin/sh. /lava-11342273/=
environment

    2023-08-24T06:17:49.360136  =


    2023-08-24T06:17:52.081293  / # . /lava-11342273/environment/lava-11342=
273/bin/lava-test-runner /lava-11342273/1

    2023-08-24T06:17:52.083430  =


    2023-08-24T06:17:52.093770  / # /lava-11342273/bin/lava-test-runner /la=
va-11342273/1

    2023-08-24T06:17:52.152859  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-24T06:17:52.153359  + cd /lava-113422<8>[   28.505137] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11342273_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f329fd031b4c1cb1e3cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f329fd031b4c1cb1e=
3ce
        failing since 197 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f30f9dcf074670b1e3b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f30f9dcf074670b1e=
3b4
        failing since 197 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f324fd031b4c1cb1e3c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f324fd031b4c1cb1e=
3c5
        failing since 197 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f60a53319d5670b1e3d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230821083218+4ec6=
595d6e5b-1~exp1~20230821083338.27))
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e6f60a53319d5670b1e3d6
        failing since 28 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-24T06:19:01.277708  / # #

    2023-08-24T06:19:01.379855  export SHELL=3D/bin/sh

    2023-08-24T06:19:01.380573  #

    2023-08-24T06:19:01.482046  / # export SHELL=3D/bin/sh. /lava-11342275/=
environment

    2023-08-24T06:19:01.482775  =


    2023-08-24T06:19:01.584137  / # . /lava-11342275/environment/lava-11342=
275/bin/lava-test-runner /lava-11342275/1

    2023-08-24T06:19:01.584455  =


    2023-08-24T06:19:01.601284  / # /lava-11342275/bin/lava-test-runner /la=
va-11342275/1

    2023-08-24T06:19:01.666806  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-24T06:19:01.667319  + cd /lava-1134227<8>[   19.151073] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11342275_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e6f3289dcf074670b1e3c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230824/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6f3289dcf074670b1e=
3c4
        failing since 77 days (last pass: next-20230605, first fail: next-2=
0230608) =

 =20
