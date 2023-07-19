Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80FCB758DC2
	for <lists+linux-next@lfdr.de>; Wed, 19 Jul 2023 08:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjGSG0f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Jul 2023 02:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjGSG0e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Jul 2023 02:26:34 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434251BFF
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 23:26:32 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-263121cd04eso3581614a91.2
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 23:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689747991; x=1692339991;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0kLv6kdyTzaYqc10oNNr0nAxDfYE/C9sz+sIbApp3to=;
        b=nzBkvnneQxbU32UjM+KLwisVJafWKGZqjcUyTxrXeCPG6GuExkbMZAsKuPIEuMiNfr
         ZBQaG+xR/qIZCtaQDWEp50n/dbK4tUcK6hzteR1qMq/Hu/tt/LpRonG8Y7MyWBhUzoKe
         meiXZWqHSDk0RMmdP6YKzApKPgxK6bclchN46QV+dMXB+pTy16cgH5CfEyAvfNHzvlwH
         vwIO8OpEEQeN8LWj5cFojq0xfemlpQvXm6h3/585fuJuivHqtNnlTmiVXihNS5Xy4Fh/
         id2DzWBOMYTzKSt4jLkLNDQkj7rMOrmyFfe9rtWBmQvYa535nwbb1AmELaeDtX9Czj8+
         rJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689747991; x=1692339991;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLv6kdyTzaYqc10oNNr0nAxDfYE/C9sz+sIbApp3to=;
        b=gURDwhxIgl8w0o2/UeveAKKUtd0qFT6B5GbEZ59MtvY8ShUX24eJil1tyAUhZOv2XF
         Q4zOjF18c5iwk7c5AQuDbLSAcT915o1LnvwPCy/j/fLuj9LMluOheXhtee2QBj4hu9bY
         gjmeSTBfgqQh+SS1E6jWIapcK8mOZ1g6zltOPOBfzDS3b9QNJUyx5/N7HHrGRRERf5qp
         AF7k9EriPU7o5195XP8Nzwb1eZKOxErgSadgIJnXaqKUktKGGqUQVnnV6j19+j5kYlSx
         /gdtQJGlcoqwWYOLG1hMPWjwD8NWtGBnoKjD5eYIgVndH7N+DUx2WaYljzfwmZGA1so0
         fkwg==
X-Gm-Message-State: ABy/qLZdwOKl3Fnv9lKtS1kPXds1lhGMo95VdWvqTFyQZkXbcg2tL7Sa
        Y3u0ArTc11tkBOuZ7xjf2nwAFRkzpzncZ6N3HKHd7A==
X-Google-Smtp-Source: APBJJlHQDVNAET1zoyK4cpZPoX2pre1+/+ctQdyOOkBaQqVBYfKp+kce15WlAn2kenncIUemeFg0mA==
X-Received: by 2002:a17:90b:1b4d:b0:263:cfc9:754a with SMTP id nv13-20020a17090b1b4d00b00263cfc9754amr1000268pjb.0.1689747991224;
        Tue, 18 Jul 2023 23:26:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a019600b0026309d57724sm574005pjc.39.2023.07.18.23.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 23:26:30 -0700 (PDT)
Message-ID: <64b78216.170a0220.2132e.11ab@mx.google.com>
Date:   Tue, 18 Jul 2023 23:26:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc2-295-ge510699ebeee
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 60 runs,
 10 regressions (v6.5-rc2-295-ge510699ebeee)
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

next/pending-fixes baseline: 60 runs, 10 regressions (v6.5-rc2-295-ge510699=
ebeee)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc2-295-ge510699ebeee/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc2-295-ge510699ebeee
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e510699ebeeec48ffefbe3ef86a96a35a6fe69c3 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74f29d76f5fe6b58ace7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b74f29d76f5fe6b58ace7d
        failing since 4 days (last pass: v6.0-rc4-326-g49ccb7c6c3ca, first =
fail: v6.4-11141-g4556f2dbce0d)

    2023-07-19T02:48:50.529658  + [   16.523736] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1237520_1.5.2.4.1>
    2023-07-19T02:48:50.529948  set +x
    2023-07-19T02:48:50.634962  =

    2023-07-19T02:48:50.736140  / # #export SHELL=3D/bin/sh
    2023-07-19T02:48:50.736544  =

    2023-07-19T02:48:50.837483  / # export SHELL=3D/bin/sh. /lava-1237520/e=
nvironment
    2023-07-19T02:48:50.837909  =

    2023-07-19T02:48:50.938870  / # . /lava-1237520/environment/lava-123752=
0/bin/lava-test-runner /lava-1237520/1
    2023-07-19T02:48:50.939547  =

    2023-07-19T02:48:50.943932  / # /lava-1237520/bin/lava-test-runner /lav=
a-1237520/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74eebd76f5fe6b58ace3d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b74eebd76f5fe6b58ace40
        failing since 0 day (last pass: v6.4-10301-g9e106c7d604e, first fai=
l: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-19T02:47:40.821241  + set +x
    2023-07-19T02:47:40.824514  <8>[   28.267231] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 987321_1.5.2.4.1>
    2023-07-19T02:47:40.931928  / # #
    2023-07-19T02:47:42.395100  export SHELL=3D/bin/sh
    2023-07-19T02:47:42.416258  #
    2023-07-19T02:47:42.416759  / # export SHELL=3D/bin/sh
    2023-07-19T02:47:44.302491  / # . /lava-987321/environment
    2023-07-19T02:47:47.763116  /lava-987321/bin/lava-test-runner /lava-987=
321/1
    2023-07-19T02:47:47.784670  . /lava-987321/environment
    2023-07-19T02:47:47.785103  / # /lava-987321/bin/lava-test-runner /lava=
-987321/1 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74f14d76f5fe6b58ace6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b74f14d76f5fe6b58ace6f
        failing since 0 day (last pass: v6.5-rc1-374-g7758824d54f7, first f=
ail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-19T02:48:35.151205  / # #
    2023-07-19T02:48:36.614615  export SHELL=3D/bin/sh
    2023-07-19T02:48:36.635162  #
    2023-07-19T02:48:36.635372  / # export SHELL=3D/bin/sh
    2023-07-19T02:48:38.521027  / # . /lava-987323/environment
    2023-07-19T02:48:41.979992  /lava-987323/bin/lava-test-runner /lava-987=
323/1
    2023-07-19T02:48:42.000776  . /lava-987323/environment
    2023-07-19T02:48:42.000890  / # /lava-987323/bin/lava-test-runner /lava=
-987323/1
    2023-07-19T02:48:42.043037  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-19T02:48:42.096539  + cd /lava-987323/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74ecb6e5ef09c618ace79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b74ecb6e5ef09c618ace7e
        failing since 0 day (last pass: v6.5-rc1-374-g7758824d54f7, first f=
ail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-19T02:47:31.580777  / # #

    2023-07-19T02:47:32.660083  export SHELL=3D/bin/sh

    2023-07-19T02:47:32.661939  #

    2023-07-19T02:47:34.152067  / # export SHELL=3D/bin/sh. /lava-11110568/=
environment

    2023-07-19T02:47:34.153847  =


    2023-07-19T02:47:36.876666  / # . /lava-11110568/environment/lava-11110=
568/bin/lava-test-runner /lava-11110568/1

    2023-07-19T02:47:36.878962  =


    2023-07-19T02:47:36.889031  / # /lava-11110568/bin/lava-test-runner /la=
va-11110568/1

    2023-07-19T02:47:36.948482  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-19T02:47:36.948984  + cd /lava-111105<8>[   28.538277] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11110568_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74eb58c8512a5558ace82

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b74eb58c8512a5558ace87
        failing since 168 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-19T02:47:00.572079  [   29.302322] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3722913_1.5.2.4.1>
    2023-07-19T02:47:00.676771  =

    2023-07-19T02:47:00.778794  / # #export SHELL=3D/bin/sh
    2023-07-19T02:47:00.779276  =

    2023-07-19T02:47:00.880604  / # export SHELL=3D/bin/sh. /lava-3722913/e=
nvironment
    2023-07-19T02:47:00.881030  =

    2023-07-19T02:47:00.982445  / # . /lava-3722913/environment/lava-372291=
3/bin/lava-test-runner /lava-3722913/1
    2023-07-19T02:47:00.983764  =

    2023-07-19T02:47:00.987105  / # /lava-3722913/bin/lava-test-runner /lav=
a-3722913/1
    2023-07-19T02:47:01.022828  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b75072a7924723a98ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b75072a7924723a98ac=
e1d
        failing since 15 days (last pass: v6.4-4072-ge8f5f1933319, first fa=
il: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74fb08b39e465d08ad034

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b74fb08b39e465d08ad=
035
        failing since 15 days (last pass: v6.4-4072-ge8f5f1933319, first fa=
il: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74f11d76f5fe6b58ace66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b74f11d76f5fe6b58ac=
e67
        new failure (last pass: v6.5-rc2-246-gefabeaa08ef1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74eb5367b9b4a7f8ace4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine=
-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine=
-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b74eb5367b9b4a7f8ace54
        failing since 0 day (last pass: v6.5-rc1-374-g7758824d54f7, first f=
ail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-19T02:47:02.956092  / # #
    2023-07-19T02:47:03.058650  export SHELL=3D/bin/sh
    2023-07-19T02:47:03.059275  #
    2023-07-19T02:47:03.160993  / # export SHELL=3D/bin/sh. /lava-3722903/e=
nvironment
    2023-07-19T02:47:03.161605  =

    2023-07-19T02:47:03.263387  / # . /lava-3722903/environment/lava-372290=
3/bin/lava-test-runner /lava-3722903/1
    2023-07-19T02:47:03.264530  =

    2023-07-19T02:47:03.283599  / # /lava-3722903/bin/lava-test-runner /lav=
a-3722903/1
    2023-07-19T02:47:03.347305  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-19T02:47:03.348038  + cd /lava-3722903<8>[   19.310723] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 3722903_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b74eb76e5ef09c618ace6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-29=
5-ge510699ebeee/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b74eb86e5ef09c618ace71
        failing since 0 day (last pass: v6.5-rc1-374-g7758824d54f7, first f=
ail: v6.5-rc2-246-gefabeaa08ef1)

    2023-07-19T02:48:38.616850  / # #

    2023-07-19T02:48:38.719063  export SHELL=3D/bin/sh

    2023-07-19T02:48:38.719783  #

    2023-07-19T02:48:38.821124  / # export SHELL=3D/bin/sh. /lava-11110564/=
environment

    2023-07-19T02:48:38.821842  =


    2023-07-19T02:48:38.923306  / # . /lava-11110564/environment/lava-11110=
564/bin/lava-test-runner /lava-11110564/1

    2023-07-19T02:48:38.924443  =


    2023-07-19T02:48:38.941116  / # /lava-11110564/bin/lava-test-runner /la=
va-11110564/1

    2023-07-19T02:48:39.008955  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-19T02:48:39.009454  + cd /lava-11110564/1/tests/1_boot<8>[   17=
.073131] <LAVA_SIGNAL_STARTRUN 1_bootrr 11110564_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
