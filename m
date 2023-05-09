Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806796FC3ED
	for <lists+linux-next@lfdr.de>; Tue,  9 May 2023 12:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbjEIKcf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 May 2023 06:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235292AbjEIKcc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 May 2023 06:32:32 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55731D07A
        for <linux-next@vger.kernel.org>; Tue,  9 May 2023 03:32:16 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-643995a47f7so5621311b3a.1
        for <linux-next@vger.kernel.org>; Tue, 09 May 2023 03:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683628335; x=1686220335;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1XglPZ5pOVRZRTZ0go697K5mhMtChLSjWmVtV6u/7ZY=;
        b=Xi/PvqCerHg7iW6OmEX0xCaXMyELhjfpnaTLORyy2RqMmX94+pxzF+ApqrkXY3q7ro
         8wsc6zJAU/ZVCDptyBzf+aHZQy3DfaXDnhZT+iIbUlxnSL6lo4GpPCx3PUnvRo8BXLUb
         L54nPkh3iIXBshaF53qN5gubaF2BZpqEllVqkVUtD18p/NcyLuq05lijLKFEKFeEzo12
         lUdtiYCTRt8dFTLHIqo7sOTzsyaOxZ0O365Ka5TF2TNVpkWfzBGB/Yc8sDPKi+gLREgi
         N2poBUklJQwzHRGs0SnGKEFnCdFJC4fUPGVPdDZy0NO/MwtUvExjllVwskEYByzz0DMU
         DRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628335; x=1686220335;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XglPZ5pOVRZRTZ0go697K5mhMtChLSjWmVtV6u/7ZY=;
        b=NSXQuDUJNg2rN9C0P4KlOFyrPZo7Duly3+luWuK9nmS0y6R3IZLmsFz3MUfq+CjNZq
         75QhNagMpbUOmPauc5S7+DY6H7LTx6vt3pwAH+1+DgN4OkKKs+fJrFQ4bLoXApSia/Dq
         sOmzILkzDoQVf7PwS/IqK928LP+aR42H1O0Uin0ijPP4N9RgN8aB4GKPJkDg7S5jBUK+
         eIu7Vog8w0BmB+F4jbE9EPXtcXiAA16Z7dGzcU6DFgbb6O1BduBRINvR9BywTwEka/Rc
         G8lujGOrBFKVCZkUvi9/8fi6dDZ43ekFPs8RxAS3AcKHCBvS3q4EiGbt4OJ7EjgyJ4sO
         /GMw==
X-Gm-Message-State: AC+VfDyp6YzIsC8DlE4wEzU5uyMat1WsBsyP8NojNx2WEddtciNdzR1H
        uVvUeEvHmcELcbSDKSs2fUx/VQkZPyCtUb8thmVOBg==
X-Google-Smtp-Source: ACHHUZ6xEMTDY/c/6AfRrTDxodtFqGFGaT8ZMBwwo4uJoDQsOkIcu2RVOC9rB63FeIwIHjj0Ej+EiA==
X-Received: by 2002:a05:6a00:a15:b0:647:5409:5d0b with SMTP id p21-20020a056a000a1500b0064754095d0bmr1008704pfh.19.1683628334849;
        Tue, 09 May 2023 03:32:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d9-20020aa78689000000b0062de9ef6915sm1407890pfo.216.2023.05.09.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:14 -0700 (PDT)
Message-ID: <645a212e.a70a0220.49059.3426@mx.google.com>
Date:   Tue, 09 May 2023 03:32:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230509
X-Kernelci-Report-Type: test
Subject: next/master baseline: 112 runs, 50 regressions (next-20230509)
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

next/master baseline: 112 runs, 50 regressions (next-20230509)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 31         =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230509/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230509
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      47cba14ce6fc4f314bd814d07269d0c8de1e4ae6 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459ee05d8f5c176412e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459ee05d8f5c176412e8=
610
        failing since 101 days (last pass: next-20230120, first fail: next-=
20230127) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459f0e54c629d12d22e863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459f0e54c629d12d22e8=
63c
        failing since 104 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eec3d7d22509972e868b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eec3d7d22509972e8=
68c
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 31         =


  Details:     https://kernelci.org/test/plan/id/6459ed2ffd236b9ae82e85f2

  Results:     140 PASS, 45 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-smi-larb16-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e85f5
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:34.181609  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:34.188396  <8>[   18.713055] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb16-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb4-probed: https://kernelci.org/test/case/id=
/6459ed2ffd236b9ae82e85f6
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:33.157841  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:33.163741  <8>[   17.689515] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb1-probed: https://kernelci.org/test/case/id=
/6459ed2ffd236b9ae82e85f7
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:32.133478  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:32.140628  <8>[   16.665539] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb20-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e85f8
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:31.110071  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:31.116272  <8>[   15.642179] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb20-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb14-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e85f9
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:29.574300  <4>[   14.097415] rt5682 1-001a: Using defa=
ult DAI clk names: rt5682-dai-wclk, rt5682-dai-bclk

    2023-05-09T06:49:29.580429  <6>[   14.097606] platform 1b00f000.larb: d=
eferred probe pending

    2023-05-09T06:49:29.587226  <6>[   14.111535] platform 1b10f000.larb: d=
eferred probe pending

    2023-05-09T06:49:29.590824  <6>[   14.111539] platform 1f002000.larb: d=
eferred probe pending

    2023-05-09T06:49:29.597088  <6>[   14.117292] platform 11210000.syscon:=
mt8192-afe-pcm: deferred probe pending

    2023-05-09T06:49:29.603909  <6>[   14.130250] platform sound: deferred =
probe pending

    2023-05-09T06:49:29.610628  <6>[   14.135302] platform 10006000.syscon:=
power-controller: deferred probe pending

    2023-05-09T06:49:29.616855  <6>[   14.142695] platform 14001000.mutex: =
deferred probe pending

    2023-05-09T06:49:29.623798  <6>[   14.148527] platform 1401d000.m4u: de=
ferred probe pending

    2023-05-09T06:49:29.630592  <6>[   14.154183] platform regulator-1v8-dp=
brdg: deferred probe pending
 =

    ... (31 line(s) more)  =


  * baseline.bootrr.mtk-smi-larb5-probed: https://kernelci.org/test/case/id=
/6459ed2ffd236b9ae82e85fa
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:29.066596  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:29.072429  <8>[   13.597267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb5-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb0-probed: https://kernelci.org/test/case/id=
/6459ed2ffd236b9ae82e85fb
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:28.042695  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:28.049100  <8>[   12.573697] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-common-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e85fd
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:27.002103  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:27.008582  <8>[   11.533472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-common-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb2-probed: https://kernelci.org/test/case/id=
/6459ed2ffd236b9ae82e860b
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:39.296937  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:39.303153  <8>[   23.829273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb17-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e860c
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:38.274340  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:38.280525  <8>[   22.806157] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb17-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb7-probed: https://kernelci.org/test/case/id=
/6459ed2ffd236b9ae82e860d
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:37.250295  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:37.257171  <8>[   21.782502] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb7-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb9-probed: https://kernelci.org/test/case/id=
/6459ed2ffd236b9ae82e860e
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:36.227831  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:36.234451  <8>[   20.759685] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb9-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb19-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e860f
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:35.204866  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:35.210937  <8>[   19.736837] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb19-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-power-controller-probed: https://kernelci.org/test/=
case/id/6459ed2ffd236b9ae82e8617
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:23.579427  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:23.586080  <8>[    8.110805] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-power-controller-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mt8192-audio-probed: https://kernelci.org/test/case/id/=
6459ed2ffd236b9ae82e8652
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:50:06.021144  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:50:06.027945  <8>[   50.557129] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt8192-audio-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-vcodec-enc-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e865a
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:50:01.843498  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:50:01.849848  <8>[   46.378288] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-vcodec-enc-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ccorr-probed: https://kernelci.org/test/c=
ase/id/6459ed2ffd236b9ae82e8672
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:55.285957  /lava-10251640/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-aal-probed: https://kernelci.org/test/cas=
e/id/6459ed2ffd236b9ae82e8674
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:54.244815  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:54.251738  <8>[   38.779275] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-aal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma4-probed: https://kernelci.org/test/c=
ase/id/6459ed2ffd236b9ae82e8676
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:53.203571  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:53.210408  <8>[   37.737767] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma0-probed: https://kernelci.org/test/c=
ase/id/6459ed2ffd236b9ae82e8677
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:52.181460  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:52.187602  <8>[   36.714724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l2-probed: https://kernelci.org/test/=
case/id/6459ed2ffd236b9ae82e8679
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:51.139929  /lava-10251640/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-gamma-probed: https://kernelci.org/test/c=
ase/id/6459ed2ffd236b9ae82e867d
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:57.369299  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:57.375879  <8>[   41.903559] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-gamma-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-color-probed: https://kernelci.org/test/c=
ase/id/6459ed2ffd236b9ae82e867f
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:56.328160  /lava-10251640/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-ovl2l0-probed: https://kernelci.org/test/=
case/id/6459ed2ffd236b9ae82e8680
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:50.115239  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:50.121730  <8>[   34.648325] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl0-probed: https://kernelci.org/test/ca=
se/id/6459ed2ffd236b9ae82e8681
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:48.078939  <8>[   32.601761] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl-driver-present RESULT=3Dpass>

    2023-05-09T06:49:49.092186  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:49.098701  <8>[   33.625841] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mutex-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e8683
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:47.470672  <6>[   32.002258] Vgpu: disabling

    2023-05-09T06:49:47.481943  <6>[   32.010112] pp3300_dpbrdg: disabling

    2023-05-09T06:49:47.484813  <6>[   32.013999] pp3300_mipibrdg: disabling

    2023-05-09T06:49:48.050982  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:48.057189  <8>[   32.583854] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mutex-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/6459e=
d2ffd236b9ae82e868e
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:44.837108  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:44.843743  <8>[   29.370442] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-iommu-probed: https://kernelci.org/test/case/id/645=
9ed2ffd236b9ae82e86a5
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:43.405994  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:43.412706  <8>[   27.938578] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-iommu-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb18-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e86a7
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:42.366515  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:42.372748  <8>[   26.899179] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb18-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb13-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e86a8
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:41.343668  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:41.350504  <8>[   25.876612] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb13-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb11-probed: https://kernelci.org/test/case/i=
d/6459ed2ffd236b9ae82e86a9
        failing since 3 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-09T06:49:40.320425  /lava-10251640/1/../bin/lava-test-case

    2023-05-09T06:49:40.327132  <8>[   24.852960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb11-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459f05bc59d6507582e869a

  Results:     178 PASS, 7 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-apmixedsys-probed: https://kernelci.org/test=
/case/id/6459f05bc59d6507582e874a
        failing since 48 days (last pass: next-20230316, first fail: next-2=
0230321)

    2023-05-09T07:03:17.020107  /lava-10252001/1/../bin/lava-test-case

    2023-05-09T07:03:17.026468  <8>[    6.121381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-apmixedsys-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eeabc01cfda3602e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eeabc01cfda3602e8=
5fa
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eeb9955668185d2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eeb9955668185d2e8=
5e9
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eef9476a15f1292e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eef9476a15f1292e8=
5ef
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eeacf91656c07a2e8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eeacf91656c07a2e8=
635
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eebd10280b39272e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eebd10280b39272e8=
62c
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie   | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459ef0f476a15f1292e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459ef0f476a15f1292e8=
60c
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eed4882f11b0142e8710

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eed4882f11b0142e8=
711
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eebc10280b39272e8628

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eebc10280b39272e8=
629
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie   | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459ef0da9efca7f302e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459ef0da9efca7f302e8=
5e7
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459eec7882f11b0142e8684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459eec7882f11b0142e8=
685
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6459efe0d635a6f1b52e8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459efe0d635a6f1b52e8=
666
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6459ee78654880c1e32e8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459ee78654880c1e32e8=
64a
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6459ed83beb765fd722e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459ed83beb765fd722e8=
5e8
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6459edfb8d03aa64ca2e8661

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230509/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230509/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6459edfb8d03aa6=
4ca2e86b8
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417)
        2 lines

    2023-05-09T06:53:25.069351  fo:

    2023-05-09T06:53:25.074131  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-09T06:53:25.081237  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-09T06:53:25.084960  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-09T06:53:25.088419  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-09T06:53:25.094119  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-09T06:53:25.097012  kern  :alert : Data abort info:

    2023-05-09T06:53:25.101329  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-09T06:53:25.104214  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-09T06:53:25.117785  kern  :alert : user pgtable: 4k pages<8>[  =
 19.318443] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6459edfb8d03aa6=
4ca2e86b9
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417)
        12 lines

    2023-05-09T06:53:25.017902  <8>[   19.221760] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-09T06:53:25.057099  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-09T06:53:25.068641  kern  :alert : Mem abort in<8>[   19.267786=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =20
