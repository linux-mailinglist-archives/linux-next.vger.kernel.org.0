Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9B1757A00
	for <lists+linux-next@lfdr.de>; Tue, 18 Jul 2023 13:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjGRLAc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Jul 2023 07:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjGRLAb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jul 2023 07:00:31 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16992CC
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 04:00:29 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-668704a5b5bso5576005b3a.0
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689678028; x=1692270028;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZE839OVgweN/G5G0uyPaHL6ERnLKcLgEQ+aPF8lGZg=;
        b=MYKpWMLpnB+NXR6AbnPtSuN71Kec/xrXWdMr9Lu/7tkKCyQjd0RCpH5BwxVsqDmpCv
         2g9NpSwdnzOhM5RqO188sDLcZD+6Tf1k+ggYe3Cx+CPyw1cePieQh/FXD6016TBP7xyV
         mpTRshNaJ6MPLeW3o5TiR89cE7kjxeLL/ffAyjWe5XlEOcjf4G93SgVeQJRx6tdJSmtz
         KaAUhhOGz0MqKxsmTqddbWo0KY8MLB4XCnVdCmMbTb9MHBQWhtjRMLdeW68lkJx42JKr
         8LHGHmFiiY9XGWsIaZKT0dg7Zl3Fk1KeEQvCuwAXiQryr30hGfWb7tL3gdoHZX6GSr2/
         RCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689678028; x=1692270028;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZE839OVgweN/G5G0uyPaHL6ERnLKcLgEQ+aPF8lGZg=;
        b=CT57tJ70BxA0dDm4FZZ0fpElTC+GNulzvW39GlgBw234RLMKReDzN5onDIqGhpW5kK
         wFfXPzhXMSOvfP4KOlD6IE0NlEJIqgtDA3qYFSKxfHptpM5Ri28wEENv+0ADmNC2G+6U
         g4nZtz6TiO2vyIlJOl5jAoxThOxRTVBsKJIHOd1KjEKIMUCyuDCNvtFpn0xveVTakdXo
         Nh6GPDFMdfc0AfZobZI7k59V3KBRygZpcABBtSg/3B95vAZdig/fOM0EFjwPCPPZi/bs
         YlxnpuRDgiDDc5zQNNviDCfSHEbTMbYThBy7LicYKATit6FOCzwPPsroU5uKPK6OG17H
         bFVg==
X-Gm-Message-State: ABy/qLbEOyflGMgechCEbmejF2oDGS36K1L5wZwDZdNTHYTXBRzhhali
        vnzQ3JBFmE75YGQMVFl8T0bNOEdKdaPzYtzCCB2kmA==
X-Google-Smtp-Source: APBJJlG7uwMFGRszL9AOb3LEnXl6YQC2TOWKFoM0Mz031u4Mu7e6N5s7WDEp3I4DCsujdInrKDdkyg==
X-Received: by 2002:a17:902:bc48:b0:1b5:5052:5af7 with SMTP id t8-20020a170902bc4800b001b550525af7mr15214576plz.8.1689678027992;
        Tue, 18 Jul 2023 04:00:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jk16-20020a170903331000b001b8a3dd5a4asm1547964plb.283.2023.07.18.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 04:00:27 -0700 (PDT)
Message-ID: <64b670cb.170a0220.0f57.33dc@mx.google.com>
Date:   Tue, 18 Jul 2023 04:00:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc2-246-gefabeaa08ef1
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 85 runs,
 13 regressions (v6.5-rc2-246-gefabeaa08ef1)
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

next/pending-fixes baseline: 85 runs, 13 regressions (v6.5-rc2-246-gefabeaa=
08ef1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =

k3-j721e-beagleboneai64      | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc2-246-gefabeaa08ef1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc2-246-gefabeaa08ef1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      efabeaa08ef1e95ca92675c66fd8a1ef7acbdde2 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b640715cae7db2d08ace26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b640715cae7db2d08ace29
        failing since 4 days (last pass: v6.0-rc4-326-g49ccb7c6c3ca, first =
fail: v6.4-11141-g4556f2dbce0d)

    2023-07-18T07:33:52.668671  + [   17.894264] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1237233_1.5.2.4.1>
    2023-07-18T07:33:52.668956  set +x
    2023-07-18T07:33:52.774230  =

    2023-07-18T07:33:52.875514  / # #export SHELL=3D/bin/sh
    2023-07-18T07:33:52.875919  =

    2023-07-18T07:33:52.976901  / # export SHELL=3D/bin/sh. /lava-1237233/e=
nvironment
    2023-07-18T07:33:52.977304  =

    2023-07-18T07:33:53.078306  / # . /lava-1237233/environment/lava-123723=
3/bin/lava-test-runner /lava-1237233/1
    2023-07-18T07:33:53.079015  =

    2023-07-18T07:33:53.082940  / # /lava-1237233/bin/lava-test-runner /lav=
a-1237233/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
k3-j721e-beagleboneai64      | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b64128556e3b1a178ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beagl=
eboneai64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beagl=
eboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b64128556e3b1a178ac=
e22
        new failure (last pass: v6.5-rc1-266-g5d4deffc2b3b) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b641532aaf0ad41e8ad034

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b641532aaf0ad41e8ad=
035
        failing since 5 days (last pass: v6.5-rc1-266-g5d4deffc2b3b, first =
fail: v6.5-rc1-303-gcfab091a85bd) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b640467f20c0c4188ace58

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b640467f20c0c4188ace5b
        new failure (last pass: v6.4-10301-g9e106c7d604e)

    2023-07-18T07:32:57.641683  + set +x
    2023-07-18T07:32:57.644885  <8>[   28.279997] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 987142_1.5.2.4.1>
    2023-07-18T07:32:57.754296  / # #
    2023-07-18T07:32:59.219027  export SHELL=3D/bin/sh
    2023-07-18T07:32:59.239912  #
    2023-07-18T07:32:59.240367  / # export SHELL=3D/bin/sh
    2023-07-18T07:33:01.127675  / # . /lava-987142/environment
    2023-07-18T07:33:04.588249  /lava-987142/bin/lava-test-runner /lava-987=
142/1
    2023-07-18T07:33:04.609695  . /lava-987142/environment
    2023-07-18T07:33:04.610108  / # /lava-987142/bin/lava-test-runner /lava=
-987142/1 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6406816eb108d908ad0fd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b6406816eb108d908ad100
        new failure (last pass: v6.5-rc1-374-g7758824d54f7)

    2023-07-18T07:33:41.829805  / # #
    2023-07-18T07:33:43.293251  export SHELL=3D/bin/sh
    2023-07-18T07:33:43.313916  #
    2023-07-18T07:33:43.314129  / # export SHELL=3D/bin/sh
    2023-07-18T07:33:45.200474  / # . /lava-987147/environment
    2023-07-18T07:33:48.659974  /lava-987147/bin/lava-test-runner /lava-987=
147/1
    2023-07-18T07:33:48.681022  . /lava-987147/environment
    2023-07-18T07:33:48.681164  / # /lava-987147/bin/lava-test-runner /lava=
-987147/1
    2023-07-18T07:33:48.725420  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-18T07:33:48.762632  + cd /lava-987147/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b661d7b16b2d53ce8ace2a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b661d7b16b2d53ce8ace2f
        new failure (last pass: v6.5-rc1-374-g7758824d54f7)

    2023-07-18T09:58:00.102827  / # #

    2023-07-18T09:58:00.204966  export SHELL=3D/bin/sh

    2023-07-18T09:58:00.205651  #

    2023-07-18T09:58:00.306950  / # export SHELL=3D/bin/sh. /lava-11106073/=
environment

    2023-07-18T09:58:00.307679  =


    2023-07-18T09:58:00.409357  / # . /lava-11106073/environment/lava-11106=
073/bin/lava-test-runner /lava-11106073/1

    2023-07-18T09:58:00.410525  =


    2023-07-18T09:58:00.427109  / # /lava-11106073/bin/lava-test-runner /la=
va-11106073/1

    2023-07-18T09:58:00.476790  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-18T09:58:00.477345  + cd /lava-111060<8>[   19.215154] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11106073_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b63ffe31e8074ea68ace44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b63ffe31e8074ea68ace49
        new failure (last pass: v6.5-rc1-374-g7758824d54f7)

    2023-07-18T07:32:04.227518  / # #

    2023-07-18T07:32:05.307245  export SHELL=3D/bin/sh

    2023-07-18T07:32:05.309077  #

    2023-07-18T07:32:06.799322  / # export SHELL=3D/bin/sh. /lava-11106070/=
environment

    2023-07-18T07:32:06.801254  =


    2023-07-18T07:32:09.524501  / # . /lava-11106070/environment/lava-11106=
070/bin/lava-test-runner /lava-11106070/1

    2023-07-18T07:32:09.526972  =


    2023-07-18T07:32:09.534479  / # /lava-11106070/bin/lava-test-runner /la=
va-11106070/1

    2023-07-18T07:32:09.596668  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-18T07:32:09.597171  + cd /lava-111060<8>[   28.513624] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11106070_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6400631e8074ea68ace4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b6400631e8074ea68ace54
        failing since 167 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-18T07:32:03.635144  [   29.743745] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3722206_1.5.2.4.1>
    2023-07-18T07:32:03.739645  =

    2023-07-18T07:32:03.841221  / # #export SHELL=3D/bin/sh
    2023-07-18T07:32:03.841676  =

    2023-07-18T07:32:03.943094  / # export SHELL=3D/bin/sh. /lava-3722206/e=
nvironment
    2023-07-18T07:32:03.943677  =

    2023-07-18T07:32:04.045182  / # . /lava-3722206/environment/lava-372220=
6/bin/lava-test-runner /lava-3722206/1
    2023-07-18T07:32:04.046242  =

    2023-07-18T07:32:04.049651  / # /lava-3722206/bin/lava-test-runner /lav=
a-3722206/1
    2023-07-18T07:32:04.085601  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b641505058a7f1ae8ad037

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b641505058a7f1ae8ad=
038
        failing since 20 days (last pass: v6.4-rc7-318-gd779731ecfed, first=
 fail: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6420321cfb2df358ace54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b6420321cfb2df358ac=
e55
        failing since 20 days (last pass: v6.4-rc7-318-gd779731ecfed, first=
 fail: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6400b31e8074ea68acec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b6400b31e8074ea68ac=
ec5
        new failure (last pass: v6.5-rc1-374-g7758824d54f7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6400d31e8074ea68acec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine=
-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine=
-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b6400d31e8074ea68acecc
        new failure (last pass: v6.5-rc1-374-g7758824d54f7)

    2023-07-18T07:32:12.500117  <8>[   18.718417] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3722223_1.5.2.4.1>
    2023-07-18T07:32:12.605318  / # #
    2023-07-18T07:32:12.706932  export SHELL=3D/bin/sh
    2023-07-18T07:32:12.707313  #
    2023-07-18T07:32:12.808622  / # export SHELL=3D/bin/sh. /lava-3722223/e=
nvironment
    2023-07-18T07:32:12.809025  =

    2023-07-18T07:32:12.910346  / # . /lava-3722223/environment/lava-372222=
3/bin/lava-test-runner /lava-3722223/1
    2023-07-18T07:32:12.911053  =

    2023-07-18T07:32:12.916914  / # /lava-3722223/bin/lava-test-runner /lav=
a-3722223/1
    2023-07-18T07:32:12.994567  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64b63ffdc8a9e97ce48ace5a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc2-24=
6-gefabeaa08ef1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b63ffdc8a9e97ce48ace5f
        new failure (last pass: v6.5-rc1-374-g7758824d54f7)

    2023-07-18T07:33:32.837337  / # #

    2023-07-18T07:33:32.938205  export SHELL=3D/bin/sh

    2023-07-18T07:33:32.938951  #

    2023-07-18T07:33:33.040343  / # export SHELL=3D/bin/sh. /lava-11106074/=
environment

    2023-07-18T07:33:33.041106  =


    2023-07-18T07:33:33.142554  / # . /lava-11106074/environment/lava-11106=
074/bin/lava-test-runner /lava-11106074/1

    2023-07-18T07:33:33.143655  =


    2023-07-18T07:33:33.145577  / # /lava-11106074/bin/lava-test-runner /la=
va-11106074/1

    2023-07-18T07:33:33.230689  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-18T07:33:33.231202  + cd /lava-11106074/1/tests/1_boot<8>[   17=
.789215] <LAVA_SIGNAL_STARTRUN 1_bootrr 11106074_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
