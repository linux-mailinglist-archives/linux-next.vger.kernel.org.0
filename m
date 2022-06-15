Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E45354C99A
	for <lists+linux-next@lfdr.de>; Wed, 15 Jun 2022 15:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348757AbiFONQR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jun 2022 09:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348905AbiFONQP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2022 09:16:15 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D49E2AE0E
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 06:16:14 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y6so5782362pfr.13
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=A4XieMsddzOSlx8ZWpe+R/CXrJEtYCo4StPR7PC4XhQ=;
        b=afUynzWfsr7M0m3dqUbYaELdaZmMx336YAE6G3T0LAtQxWTTDOKEU8a5nvCJQ4vw5l
         Hod0rKyeqdBy3PJXtcQJUpMUX2Ibg9+GFvN5veLJX6usTkf+tjkhUi0a4mjnIxCi0ri/
         tMdAhoW3Bk6KBb3i5VeoWpNY9Msa2DzOb1eGs9BfSxL58M26wBUNjudFb/6iLQa4pfZQ
         Xks1MZ2KecXTozYjfk+iIV+v1bUdZZYjeUQ6EiV9p/CZmm6X4M/wLLlgveNKmgPZjOSy
         tx5RNNTETBmpxkZ+CRNWdTNLbqlLLfiGRA7JaY4YTzefxPL5xYgs7Ywsau0yPI8cA4I/
         +6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=A4XieMsddzOSlx8ZWpe+R/CXrJEtYCo4StPR7PC4XhQ=;
        b=YZ10WqvQjuCn6h4XjCfAZfMoimfyPn6K0SPhjW9hFBtQ/dR6w86duq7AMwYTHYLHuS
         ZqWTgC6s9GO7wd5tuwSMrx1OuAOCf6u0iQYraMfgUef1n0h++81bcWOecrj7D6UnaMAt
         MSOZLJmuciVOhM4RcgNuXATBLlekmdOrzWwD/5edCLnrIs20g2miivgk7UIcIpsXwasH
         Do6AiGEx2dZie9GvVWvx5rcuT4HXiZTY1TsPjSBsMAwRARQpcbPfoQQkezjSCMRQy9S1
         oPD/fAVExFktxmQmiUDhUM5w+yi7Qe82bq5kV8iaDcwyOr0s15UlIpgpKYR2AcPhwgGJ
         QhCA==
X-Gm-Message-State: AJIora9VMpkcyhFaqKAAZv48kwOCkmU4JPw16Tf1e9riPjvGRhHKtoXq
        fCIvJqF4YOXzgvKgL8VmrNASM6IU+PZ1Umus9Xg=
X-Google-Smtp-Source: AGRyM1uUqOyyX4sGF5fn/RI4FMf8WfTWn8NwMq2p3KbCH4BxIpWio9fPvOJHQdf5AT97OhCKiz/kVA==
X-Received: by 2002:a05:6a00:2999:b0:51b:e3c8:9e30 with SMTP id cj25-20020a056a00299900b0051be3c89e30mr9814553pfb.41.1655298973681;
        Wed, 15 Jun 2022 06:16:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a5-20020a62d405000000b00522cae827f6sm1139398pfh.197.2022.06.15.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:16:13 -0700 (PDT)
Message-ID: <62a9db9d.1c69fb81.2d22e.12a3@mx.google.com>
Date:   Wed, 15 Jun 2022 06:16:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220615
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 43 runs, 4 regressions (next-20220615)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 43 runs, 4 regressions (next-20220615)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 3          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220615/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220615
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6012273897fefb12566580efedee10bb06e5e6ed =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62a9a8539d47941f7ca39bfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a9a8539d47941f7ca39=
bfc
        failing since 33 days (last pass: next-20220506, first fail: next-2=
0220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/62a9a8a94af6b41b03a39be8

  Results:     84 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62a9a8a94af6b41b03a39c2c
        failing since 48 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-06-15T09:38:30.596064  /lava-6619857/1/../bin/lava-test-case
    2022-06-15T09:38:30.609043  <8>[   51.039340] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62a9a8a94af6b41b03a39c2d
        failing since 48 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-06-15T09:38:29.559113  /lava-6619857/1/../bin/lava-test-case
    2022-06-15T09:38:29.573863  <8>[   50.003292] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62a9a8a94af6b41b03a39c2e
        failing since 48 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-06-15T09:38:27.514050  <8>[   47.940381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-06-15T09:38:27.710728  <4>[   48.136563] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-06-15T09:38:28.539171  /lava-6619857/1/../bin/lava-test-case
    2022-06-15T09:38:28.553500  <8>[   48.982899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
