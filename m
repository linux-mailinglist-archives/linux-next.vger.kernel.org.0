Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B4278485C
	for <lists+linux-next@lfdr.de>; Tue, 22 Aug 2023 19:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjHVRXH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Aug 2023 13:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjHVRXG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Aug 2023 13:23:06 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05485364A2
        for <linux-next@vger.kernel.org>; Tue, 22 Aug 2023 10:22:53 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bf7a6509deso16012395ad.3
        for <linux-next@vger.kernel.org>; Tue, 22 Aug 2023 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692724973; x=1693329773;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K3OGnat1cs7isM+MWoMEq3oORqsnwG6MlNRLilhw8jc=;
        b=AEHLzH/+0mFGhdCAZg15BXGGiO4Fh2aCJiTw2yrETFdL8MxaZm37+ZRxkINCBAvLzY
         H8COJWF7dfh2/icxEiqxrNQYZ4KXqJwgL7v6RYwNy2Es+cmjmOe+H0cgI1Ed5lyFKxOy
         bYYTFcWe5pZKdYELyTaSYjUBlK5AmUkCjc4BZRplwG8VF1RkbkNbqXaF+8swZlJLx+O2
         hef8FY2DcHmDu/vARkwzwJnl7FR9nZK4NTm7k/yJwlu++Jg5sDzMT+OOUM5aFSSyGN0E
         ABpfh6b98JfBpgQGiKorzwjm2Sh1xzpeesMPFg9J4DtZbz84jlRdW2MHfAawtAofwc+T
         GIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692724973; x=1693329773;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3OGnat1cs7isM+MWoMEq3oORqsnwG6MlNRLilhw8jc=;
        b=KaaLy4ZJhlclk9XwUVSLH2lMh5WO8rIOIfGRrRI8O4YBKaUu+/0R9e52Xlqo4owkMe
         18VeR/MEzVqLaRXOmcFjeSW96Re9G01ZT61GtJ6G98Wy7YM+r5D+XCArauXPma3jGdWV
         RVGFvGI0YZ3FQhS0Psc1MKL9bqWFXNDkZb9vZPekQJrGWk5dC+TR2Gpn5Mt9RotVd7k+
         gspEDVoLtT0dGoLC8J4UemyCKaxvUcGKBAYFo6vsFfhlHwktKm+6PZo2YYCraJVvuB2l
         i7fECHbD2PWcHfWvdo3XwpClx4q/nbXnmdRraJ4RiKzV6Sf/XfMDAL/IKKcjcWjlD4YN
         M2sQ==
X-Gm-Message-State: AOJu0YyBXciFXovs6LPukP5X+TGH4GP40xKt4dPCFardyY9c9vySWBDq
        ZXkPzBkhYIMCdNhRP4CefcF09GoF2SCQ0GdmGiA=
X-Google-Smtp-Source: AGHT+IHclaOnNQjUvbKg+KVVGZbgNYqEz/LiJYX5i0T7WeL5nXOykqYqlcT0jE27cZC4gYqMtZAfzw==
X-Received: by 2002:a17:902:aa42:b0:1bf:6a06:7b4c with SMTP id c2-20020a170902aa4200b001bf6a067b4cmr6577828plr.36.1692724972810;
        Tue, 22 Aug 2023 10:22:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902d4cc00b001b8a00d4f7asm9339537plg.9.2023.08.22.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 10:22:52 -0700 (PDT)
Message-ID: <64e4eeec.170a0220.d2391.1751@mx.google.com>
Date:   Tue, 22 Aug 2023 10:22:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230822
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 259 runs, 14 regressions (next-20230822)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 259 runs, 14 regressions (next-20230822)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

imx8mp-evk                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230822/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230822
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      28c736b0e92e11bfe2b9997688213dc43cb22182 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4b461471181f91fb1e42e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4b461471181f91fb1e=
42f
        failing since 15 days (last pass: next-20230804, first fail: next-2=
0230807) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-broonie     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4be5fe1925f1828b1e3e2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e4be5fe1925f1828b1e3e7
        failing since 6 days (last pass: next-20230807, first fail: next-20=
230815)

    2023-08-22T13:55:18.934877  + set<8>[   28.458446] <LAVA_SIGNAL_ENDRUN =
0_dmesg 64358_1.5.2.4.1>
    2023-08-22T13:55:18.935451   +x
    2023-08-22T13:55:19.043803  / # #
    2023-08-22T13:55:20.209768  export SHELL=3D/bin/sh
    2023-08-22T13:55:20.215880  #
    2023-08-22T13:55:21.659000  / # export SHELL=3D/bin/sh. /lava-64358/env=
ironment
    2023-08-22T13:55:21.665133  =

    2023-08-22T13:55:24.277244  / # . /lava-64358/environment/lava-64358/bi=
n/lava-test-runner /lava-64358/1
    2023-08-22T13:55:24.284015  =

    2023-08-22T13:55:24.294041  / # /lava-64358/bin/lava-test-runner /lava-=
64358/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4bfdb8b6f1257feb1e3b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e4bfdb8b6f1257feb1e3b6
        failing since 6 days (last pass: next-20230809, first fail: next-20=
230815)

    2023-08-22T14:01:45.309525  + set<8>[   28.257734] <LAVA_SIGNAL_ENDRUN =
0_dmesg 64415_1.5.2.4.1>
    2023-08-22T14:01:45.309925   +x
    2023-08-22T14:01:45.420217  / # #
    2023-08-22T14:01:46.585950  export SHELL=3D/bin/sh
    2023-08-22T14:01:46.592052  #
    2023-08-22T14:01:48.035478  / # export SHELL=3D/bin/sh. /lava-64415/env=
ironment
    2023-08-22T14:01:48.041527  =

    2023-08-22T14:01:50.653163  / # . /lava-64415/environment/lava-64415/bi=
n/lava-test-runner /lava-64415/1
    2023-08-22T14:01:50.659879  =

    2023-08-22T14:01:50.669290  / # /lava-64415/bin/lava-test-runner /lava-=
64415/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4c067ef36d502fbb1e3af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64e4c067ef36d502fbb1e3b4
        failing since 6 days (last pass: next-20230809, first fail: next-20=
230815)

    2023-08-22T14:03:58.257559  / # #
    2023-08-22T14:03:59.423467  export SHELL=3D/bin/sh
    2023-08-22T14:03:59.429524  #
    2023-08-22T14:04:00.872830  / # export SHELL=3D/bin/sh. /lava-64468/env=
ironment
    2023-08-22T14:04:00.878838  =

    2023-08-22T14:04:03.491035  / # . /lava-64468/environment/lava-64468/bi=
n/lava-test-runner /lava-64468/1
    2023-08-22T14:04:03.497812  =

    2023-08-22T14:04:03.511618  / # /lava-64468/bin/lava-test-runner /lava-=
64468/1
    2023-08-22T14:04:03.525159  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-22T14:04:03.540991  + cd /l<8>[   29.863302] <LAVA_SIGNAL_START=
RUN 1_bootrr 64468_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4b415506b30ca47b1e421

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230724112100+8a0b=
2ca8217f-1~exp1~20230724112220.789))
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4b415506b30ca47b1e=
422
        failing since 20 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4b72b892e7cd4feb1e3ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4b72b892e7cd4feb1e=
3bb
        failing since 209 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4b74e892e7cd4feb1e3c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4b74e892e7cd4feb1e=
3c4
        failing since 196 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4be9136e1e36c70b1e3bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4be9136e1e36c70b1e=
3be
        failing since 210 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4be8756ac1c74b2b1e3b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4be8756ac1c74b2b1e=
3b9
        failing since 195 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4be8456ac1c74b2b1e3af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4be8456ac1c74b2b1e=
3b0
        failing since 195 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4b5155653c6bf40b1e3be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4b5155653c6bf40b1e=
3bf
        new failure (last pass: next-20230816) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4be8736e1e36c70b1e3b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4be8736e1e36c70b1e=
3b8
        failing since 195 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4b92320f10363f1b1e406

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4b92320f10363f1b1e=
407
        failing since 196 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64e4be48b84ef8aa2db1e3bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230822/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e4be48b84ef8aa2db1e=
3be
        failing since 77 days (last pass: next-20230601, first fail: next-2=
0230606) =

 =20
