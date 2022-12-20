Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694B6651ADE
	for <lists+linux-next@lfdr.de>; Tue, 20 Dec 2022 07:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbiLTGpV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Dec 2022 01:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbiLTGpU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Dec 2022 01:45:20 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE8B12759
        for <linux-next@vger.kernel.org>; Mon, 19 Dec 2022 22:45:19 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d15so11339971pls.6
        for <linux-next@vger.kernel.org>; Mon, 19 Dec 2022 22:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hBVifKHY7uRnGLpQU50GeVchpnE2eOEKQKJTw9hl3XA=;
        b=RH+dv/hvpN6X3UqZgVuMbTqp6EvZ+HVsYI5VLmgN6Niliwip+yWUEctUJpJAkfFKMx
         OcEijhVaYccA8dTZdD3cnHv/PLoLMVllV6Ssi1l768PzCbv8ehAliX+acgsGRlIrFpEB
         4BxD0av6nV0p7ErYrUT0K6G28MEW1RHbrwug7tr+Gc74XK5xSo5sXZGai/6RFUaqjrF2
         3PIJxG6sYz7MOrMtp4RhBH564+ST01X+c20eFBB3k4+jSqwY+kY5tJSDdkcdk8PRY2Wd
         /jMfh8W6u+qTg2H9h1YKRr835DsrACYhQcVWop3dV6kIpBAXSc+zgawZ4MAVk6qQQkwS
         DQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBVifKHY7uRnGLpQU50GeVchpnE2eOEKQKJTw9hl3XA=;
        b=SMs5IP64nogHVzQ2BrP0C8Q0nOuWMAPCVwvzc5RDPL7/ohrbFlnBrYn5gQLDENxceu
         4LxxWFKmXv1lR2fzPgvq+v0l/PaSkxygQFHrimrOXWtKN4bEwyj1dLikse6tQ4Hf03ql
         9yhYC7X8uJaMA7yRhj8JKJYOaodLHhU38sJL09ECgnyqro/xcezz3e2Q23FpsuXUwDK/
         EPr+c+plcoJlLn4BE5lSVFpy/qVHcl2N+RhepzPqxphJLA5qzHZ12L1NIxS5CoK6UT2v
         txF3uJ7m5KQMMIjW41cqH9Xld1cYmLQL3kCKsZ2Iq2RP9cNCet/b3wpDSdwPJ8VOIp1C
         vGEQ==
X-Gm-Message-State: ANoB5pmgSWfsxPUbskGcr0eja53tF/TS/8NdHBrwpVU2JQmcNe1KNxJF
        smwqdvvs+061oUOQy64j4K5Oz8td2SgGZ+Fq1jQ=
X-Google-Smtp-Source: AA0mqf53x9D+/6ZjBtE3sPY+2xJzUJM7l8G+tSp/lb6KkXsod9nAY8ZngorKdV2gA8gx7hn+5lly1A==
X-Received: by 2002:a17:90a:c7c7:b0:219:89c3:2847 with SMTP id gf7-20020a17090ac7c700b0021989c32847mr46091630pjb.44.1671518718475;
        Mon, 19 Dec 2022 22:45:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d21-20020a630e15000000b00476b165ff8bsm4633193pgl.57.2022.12.19.22.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 22:45:17 -0800 (PST)
Message-ID: <63a159fd.630a0220.ee7c4.76d3@mx.google.com>
Date:   Mon, 19 Dec 2022 22:45:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.1-14044-gc28c7d2a33a8
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 530 runs,
 4 regressions (v6.1-14044-gc28c7d2a33a8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 530 runs, 4 regressions (v6.1-14044-gc28c7d2a3=
3a8)

Regressions Summary
-------------------

platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
da850-lcdk                   | arm  | lab-baylibre | gcc-10   | davinci_all=
_defconfig        | 1          =

jetson-tk1                   | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-10   | oxnas_v6_de=
fconfig           | 1          =

r8a7743-iwg20d-q7            | arm  | lab-cip      | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-14044-gc28c7d2a33a8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-14044-gc28c7d2a33a8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c28c7d2a33a85439d90c17712b71ec6907033d5f =



Test Regressions
---------------- =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
da850-lcdk                   | arm  | lab-baylibre | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63a11fecb179ffbcc54eee45

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63a11fecb179ffb=
cc54eee49
        failing since 330 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-12-20T02:37:14.569416  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-12-20T02:37:14.570071  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-12-20T02:37:14.572646  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-12-20T02:37:14.619408  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
jetson-tk1                   | arm  | lab-baylibre | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63a1441ce463df00ec4eee7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a1441ce463df00ec4ee=
e7c
        failing since 234 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-10   | oxnas_v6_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63a11f3c3ea53808494eee3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a11f3c3ea53808494ee=
e3f
        failing since 69 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm  | lab-cip      | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63a1201af97ee6a7604eee23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-14044-=
gc28c7d2a33a8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221216.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63a1201af97ee6a7604ee=
e24
        failing since 6 days (last pass: v6.1-2435-g5c02e5d167d0, first fai=
l: v6.1-6378-g44d433ee7540) =

 =20
