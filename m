Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9F17C9D65
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 04:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjJPC3j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Oct 2023 22:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjJPC3i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Oct 2023 22:29:38 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C56AB
        for <linux-next@vger.kernel.org>; Sun, 15 Oct 2023 19:29:36 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-578b407045bso3029320a12.0
        for <linux-next@vger.kernel.org>; Sun, 15 Oct 2023 19:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697423376; x=1698028176; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ADprf8JgcwuVHJ/Bn5dY+UocUfTzoR2PRW3S2unxTvo=;
        b=TLOt/BNqpYRfZqZq9k3Zr519DOc/Qbm7JxMRqnaXaWXdUU3wJPkoZr8O4MCQlLqIJE
         Kz86vh0Zku8u1to7ndKvQlieASSfue/XJm18wHic22ILLcKoThrytx8dssETHqBQFS46
         xBLfQClcLNrGZ7CBPB0eScU2fBK84+wBm8zaBF5bmMaPIeHEV0RurEFjkmlTZbpQ6ER/
         kgaqzbWDHW4ESGfH1NjDg5uTbmbtPAAKRTapKbzreKg1YXUeg35sW2PH02GD2abjT9oJ
         LAaCXArlYvWEQ1sK7WqEYynFxmQmd23mp4hIORaBQG9UO2XZ0wLHuSxwIsXymv2YKE51
         SjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697423376; x=1698028176;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADprf8JgcwuVHJ/Bn5dY+UocUfTzoR2PRW3S2unxTvo=;
        b=rVs+02Or3TTW19vlSO/vthSutq9VJZR2j+YFMPfamei0HWOh5v4OUDb5v5NLle5/1V
         U6hpslYvCHO/kuv2TGgzf3X9/1OXwW+SE8Rlpq9HxQeMORwsoEjODcRBZ5413GBIIyRj
         7a5gq7Rtu1oqBKt4wGcNAdX8y2BTnGLoSB60Ss6oKMDLBo02ZngTtKshtd70ROn+MUsn
         73bciS4yByxuWy1XmM0qT6pNV4pdMM5701OhMgTYNz+9Dd7qCWMLtXfltoasq3/MikpE
         tbF+wIt3mjqkLYrCZkrJdrYht/kDwTNcTR0gaidQknBe3WuP1FaUQl2OF53Vvdz2hZfs
         p7HA==
X-Gm-Message-State: AOJu0YxQisN1FCdFJMZu6fjIcsVtiCFonRzT1ypmLDV6Ye+dA9btJdP0
        aa1gFFr2FzG+0YXqHvjbtSGFIOhAlFJ5HgfqWL1rJg==
X-Google-Smtp-Source: AGHT+IEaCuMQzZdqgUyxuL4FITdps5kVbt2YBk8WspcQ0YxSPT6TIejCDpX26xbcPrejHiSr72Lkkg==
X-Received: by 2002:a05:6a20:441e:b0:155:2359:2194 with SMTP id ce30-20020a056a20441e00b0015523592194mr43974418pzb.46.1697423375811;
        Sun, 15 Oct 2023 19:29:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pq5-20020a17090b3d8500b0027d0ebf7466sm3614499pjb.21.2023.10.15.19.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 19:29:35 -0700 (PDT)
Message-ID: <652ca00f.170a0220.93651.ae7e@mx.google.com>
Date:   Sun, 15 Oct 2023 19:29:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc6-220-ged04e49eed957
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 84 runs,
 5 regressions (v6.6-rc6-220-ged04e49eed957)
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

next/pending-fixes baseline: 84 runs, 5 regressions (v6.6-rc6-220-ged04e49e=
ed957)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mn-ddr4-evk    | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =

imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =

rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =

sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc6-220-ged04e49eed957/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc6-220-ged04e49eed957
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ed04e49eed95720c0264e0cb136569b13d87f62a =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mn-ddr4-evk    | arm64 | lab-baylibre  | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/652c6f4190cf8d2f1aefcf0f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652c6f4190cf8d2f1aefcf18
        failing since 17 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-15T23:00:47.370930  + set<8>[   19.444903] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3807066_1.5.2.4.1>
    2023-10-15T23:00:47.371131   +x
    2023-10-15T23:00:47.476678  / # #
    2023-10-15T23:00:48.631319  export SHELL=3D/bin/sh
    2023-10-15T23:00:48.636802  #
    2023-10-15T23:00:50.177410  / # export SHELL=3D/bin/sh. /lava-3807066/e=
nvironment
    2023-10-15T23:00:50.182917  =

    2023-10-15T23:00:52.992021  / # . /lava-3807066/environment/lava-380706=
6/bin/lava-test-runner /lava-3807066/1
    2023-10-15T23:00:52.997749  =

    2023-10-15T23:00:52.997953  / # /lava-3807066/bin/lava-te<3>[   23.6955=
27] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resista=
nce =

    ... (13 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
imx8mp-evk         | arm64 | lab-broonie   | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/652c6ffc79c607fbfcefcef9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652c6ffc79c607fbfcefcf02
        failing since 40 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-15T23:04:02.147538  + set<8>[   27.797419] <LAVA_SIGNAL_ENDRUN =
0_dmesg 173312_1.5.2.4.1>
    2023-10-15T23:04:02.147929   +x
    2023-10-15T23:04:02.256914  / # #
    2023-10-15T23:04:03.422828  export SHELL=3D/bin/sh
    2023-10-15T23:04:03.428993  #
    2023-10-15T23:04:04.927268  / # export SHELL=3D/bin/sh. /lava-173312/en=
vironment
    2023-10-15T23:04:04.933323  =

    2023-10-15T23:04:07.654563  / # . /lava-173312/environment/lava-173312/=
bin/lava-test-runner /lava-173312/1
    2023-10-15T23:04:07.661108  =

    2023-10-15T23:04:07.668752  / # /lava-173312/bin/lava-test-runner /lava=
-173312/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
rk3399-roc-pc      | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/652c6f18da57dc8157efcf52

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652c6f18da57dc8157efcf5b
        failing since 2 days (last pass: v6.6-rc5-359-g960f4d0f660c7, first=
 fail: v6.6-rc5-397-g1026f1ab9e072)

    2023-10-15T23:00:32.359130  <8>[   21.887331] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438793_1.5.2.4.1>
    2023-10-15T23:00:32.463931  / # #
    2023-10-15T23:00:32.565663  export SHELL=3D/bin/sh
    2023-10-15T23:00:32.566304  #
    2023-10-15T23:00:32.667414  / # export SHELL=3D/bin/sh. /lava-438793/en=
vironment
    2023-10-15T23:00:32.668171  =

    2023-10-15T23:00:32.769339  / # . /lava-438793/environment/lava-438793/=
bin/lava-test-runner /lava-438793/1
    2023-10-15T23:00:32.770313  =

    2023-10-15T23:00:32.775230  / # /lava-438793/bin/lava-test-runner /lava=
-438793/1
    2023-10-15T23:00:32.821185  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-clabbe    | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/652c6f17da57dc8157efcf47

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652c6f17da57dc8157efcf50
        failing since 4 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.6-rc5-300-g24760d837661b)

    2023-10-15T23:00:26.773998  <8>[   18.856796] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438788_1.5.2.4.1>
    2023-10-15T23:00:26.879279  / # #
    2023-10-15T23:00:26.981002  export SHELL=3D/bin/sh
    2023-10-15T23:00:26.981591  #
    2023-10-15T23:00:27.082660  / # export SHELL=3D/bin/sh. /lava-438788/en=
vironment
    2023-10-15T23:00:27.083482  =

    2023-10-15T23:00:27.184730  / # . /lava-438788/environment/lava-438788/=
bin/lava-test-runner /lava-438788/1
    2023-10-15T23:00:27.185855  =

    2023-10-15T23:00:27.189121  / # /lava-438788/bin/lava-test-runner /lava=
-438788/1
    2023-10-15T23:00:27.268545  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab           | compiler | defconfig | regress=
ions
-------------------+-------+---------------+----------+-----------+--------=
----
sun50i-h6-pine-h64 | arm64 | lab-collabora | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/652c6f26da57dc8157efcfc9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc6-22=
0-ged04e49eed957/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652c6f26da57dc8157efcfd2
        failing since 4 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.6-rc5-300-g24760d837661b)

    2023-10-15T23:04:55.021627  / # #

    2023-10-15T23:04:55.123783  export SHELL=3D/bin/sh

    2023-10-15T23:04:55.124493  #

    2023-10-15T23:04:55.225893  / # export SHELL=3D/bin/sh. /lava-11783798/=
environment

    2023-10-15T23:04:55.226593  =


    2023-10-15T23:04:55.328023  / # . /lava-11783798/environment/lava-11783=
798/bin/lava-test-runner /lava-11783798/1

    2023-10-15T23:04:55.329093  =


    2023-10-15T23:04:55.346000  / # /lava-11783798/bin/lava-test-runner /la=
va-11783798/1

    2023-10-15T23:04:55.414023  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-15T23:04:55.414525  + cd /lava-1178379<8>[   17.300548] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11783798_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
