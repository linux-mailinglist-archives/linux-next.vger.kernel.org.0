Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE858751695
	for <lists+linux-next@lfdr.de>; Thu, 13 Jul 2023 05:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGMDAI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Jul 2023 23:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjGMDAH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jul 2023 23:00:07 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B213172C
        for <linux-next@vger.kernel.org>; Wed, 12 Jul 2023 20:00:06 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5661e8f4c45so255922eaf.1
        for <linux-next@vger.kernel.org>; Wed, 12 Jul 2023 20:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689217205; x=1691809205;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bCupddgv5X/6fchLhbz3QwjHCTfYKIM+2GK/oVKSIxs=;
        b=vflCQKn0SWUNMR5rQ7lvieaRxZYWyRt1IEtbkMX6go5KV++nWnRFMC39sBeCtbY16p
         aADCRoGw3e/QN/KUhXUJih3cJ7ZwouQbV4SX8CkdGp5p9VcqTlXmShuOzZQHQG19Llw2
         55kA9XdlOfW5RXHLruapb9iF4AiJvWfCZ0JG7zVh4h2tdgsqXNCb/+ZbeTDTkb0cr3Ko
         KaAyIZwlrNy+oAdv7FenL0IY1zLf6FKZusw7gwUbUg7aIDai7KjDIIMEg/3VikCm9XEO
         h2TrjqxBoc8g5ACrR5yYnNzzHvX1ZVLrpZ71eu/9E2vZ5xRuijYF79I+k+cC/f9unu87
         ZA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689217205; x=1691809205;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCupddgv5X/6fchLhbz3QwjHCTfYKIM+2GK/oVKSIxs=;
        b=XFZLTxTXR8mGvbEL9CaAQxHyi8srRY7ckePTCFPdwlSCSYWnoe/K2pzoUUKTxah66F
         LBUvv2O7GimEOki/jCLvmJcMTPL8IvaUi8yRudGSW86DnBM2HObiHi/o9WsxaVSAOQ1w
         EgTbpZj1bijEa2R5yKphciqrWwIJqPMWIG4kJDt+Bb4I5q+w/kMvpntjzmeJ6cR0du90
         77IFbcHaPw1bgaW5DdMJ2GbQRDSuWRHLexRzQmavn6T0qlcnIA2SZHkf99uAB1endEvv
         bFOrm1CiHMHPfMKmiq88OUTTlwu7SAKrd6+bhRaA8oM4/806wiqSUcx7L4rgS2AMinuA
         fLMw==
X-Gm-Message-State: ABy/qLbnxPIvgRsWZ740IU5/nnVox2QyCtmk0sdYuNx2icIiNLYGNrdi
        nDV488SCyoi3mjEKYeoHht/t7RPcBGDUWMgPgtO7Kw==
X-Google-Smtp-Source: APBJJlEkDfoYUn9HnSeIlSGgeLB1hu5Ol+22pZ/OW50KEB9jMlzebMIF7dSIUKK42n9J12yMBNSmuQ==
X-Received: by 2002:a05:6358:4402:b0:129:d05d:691e with SMTP id z2-20020a056358440200b00129d05d691emr1044566rwc.19.1689217204879;
        Wed, 12 Jul 2023 20:00:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902ff0100b001b8b26fa6c1sm4667736plj.115.2023.07.12.20.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 20:00:04 -0700 (PDT)
Message-ID: <64af68b4.170a0220.36f80.a60e@mx.google.com>
Date:   Wed, 12 Jul 2023 20:00:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc1-303-gcfab091a85bd
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 84 runs,
 5 regressions (v6.5-rc1-303-gcfab091a85bd)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 84 runs, 5 regressions (v6.5-rc1-303-gcfab091a=
85bd)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
meson-g12a-u200              | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

rk3328-rock64                | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc1-303-gcfab091a85bd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc1-303-gcfab091a85bd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cfab091a85bd646090b3f22425dd0da9524c0da3 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
meson-g12a-u200              | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64af3954c8baee664f8ace36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af3954c8baee664f8ac=
e37
        new failure (last pass: v6.5-rc1-266-g5d4deffc2b3b) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
rk3328-rock64                | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64af37d6a747d8df998ace1e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af37d6a747d8df998ace23
        failing since 161 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-12T23:31:27.241638  [   30.151066] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3720204_1.5.2.4.1>
    2023-07-12T23:31:27.346411  =

    2023-07-12T23:31:27.448350  / # #export SHELL=3D/bin/sh
    2023-07-12T23:31:27.448843  =

    2023-07-12T23:31:27.550365  / # export SHELL=3D/bin/sh. /lava-3720204/e=
nvironment
    2023-07-12T23:31:27.551228  =

    2023-07-12T23:31:27.653288  / # . /lava-3720204/environment/lava-372020=
4/bin/lava-test-runner /lava-3720204/1
    2023-07-12T23:31:27.654646  =

    2023-07-12T23:31:27.658047  / # /lava-3720204/bin/lava-test-runner /lav=
a-3720204/1
    2023-07-12T23:31:27.694239  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64af3970685800b37e8ace6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af3970685800b37e8ac=
e6b
        failing since 9 days (last pass: v6.4-4072-ge8f5f1933319, first fai=
l: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64af38cf511e6e15048ace32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af38cf511e6e15048ac=
e33
        failing since 9 days (last pass: v6.4-4072-ge8f5f1933319, first fai=
l: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64af3e7152331fbe118ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-30=
3-gcfab091a85bd/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af3e7152331fbe118ac=
e23
        new failure (last pass: v6.5-rc1-146-g2654f2b00aa0) =

 =20
