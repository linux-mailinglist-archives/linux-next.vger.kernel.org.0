Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFE244A54A
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 04:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236890AbhKIDXI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Nov 2021 22:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbhKIDXI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Nov 2021 22:23:08 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E31BC061570
        for <linux-next@vger.kernel.org>; Mon,  8 Nov 2021 19:20:23 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id j9so17161424pgh.1
        for <linux-next@vger.kernel.org>; Mon, 08 Nov 2021 19:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dPoYSuwQn2swj91smUQZ+lA+KeCERv8e99FZt/90Vrs=;
        b=HcEwh2+5Ly2nm1bIXQwI1zU/c9shJmMFZSRFU9aLB4RI7DgBWlms1/2MOatL0NJsZE
         S4nlEyNthWNCaL5larK7NjlxaxN6PSxOxn4KMEimC/UFfJnSlDhX+/S8ONkqYHz3+8Tu
         jAvrSmOJiIY/bZlWn+GgO1CLMnaqdgkND7saP9WwRlMQ010M7MNxEcPTcYlj458Czh7g
         8v+ZIV6kEpmCAnTvGbQvgKODnS9VJiGZNOo85RdNonULQajHn05JWxzTuyjNYUhTh9Fq
         yzSQD2T1ve2cJy0uvOPagFEMlaA/LMl9o81nBNTkAWd+YQTbavtjkIsz63FmXSwdsx+Z
         dmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dPoYSuwQn2swj91smUQZ+lA+KeCERv8e99FZt/90Vrs=;
        b=mdlQYd+PoB2u5uUoVPuNKkCUER601U3aBVQVyN9bNtRN8eYCLGbNSGvhczMWCCbwkV
         bJXAa00GSi/5X6fyLyKHckX71jhj7lf4zmi73SbYhzI4V+rIxzt6/RayH5Fmr1IQfQiS
         gAzf4NU6HiatLjJilXoN8G+FNSVccFXUrinrW+LLoAv2QP9+YXQ9T4susf1iDIZPMmYq
         UFlQUUc6K+o/pUIfvCBOAuzXUInyUkMJl4nQxDd9Ok5JeYNuMBIaH87XRtEqAzow0M5b
         aLBE91Mf/R5WvGqreTCNI6g18nPeaRnl5Qp34b6NumSSuqT4fA7W8yB27SNAVRX7kcXU
         etcQ==
X-Gm-Message-State: AOAM531PiUPXHb7bSfY1OzPbHj7KoXcbC0EQlYYBX2ZxJfYfs6xq3sPt
        VIWBVy1GcLwgm4In7Q3Hwwlhy2u4/7MdSmrj
X-Google-Smtp-Source: ABdhPJwq3EoY4b2aPf4vrDAQ56NnhApYhSQ6M/9uKQnAupMbBzW0GsNjEEciVSsI8oqOb6FhwWURWw==
X-Received: by 2002:a63:545f:: with SMTP id e31mr3494488pgm.8.1636428022620;
        Mon, 08 Nov 2021 19:20:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f8sm674460pjq.29.2021.11.08.19.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 19:20:22 -0800 (PST)
Message-ID: <6189e8f6.1c69fb81.29de.3c38@mx.google.com>
Date:   Mon, 08 Nov 2021 19:20:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-11821-ge562220410d1
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 536 runs,
 2 regressions (v5.15-11821-ge562220410d1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 536 runs, 2 regressions (v5.15-11821-ge5622204=
10d1)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+crypto=
             | 1          =

rk3288-rock2-square   | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-11821-ge562220410d1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-11821-ge562220410d1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e562220410d1220cf853792bb908bf15dd1e5238 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-10   | defconfig+crypto=
             | 1          =


  Details:     https://kernelci.org/test/plan/id/6189b204d2d0f812d83358dc

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-11821=
-ge562220410d1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-11821=
-ge562220410d1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.leds-gpio-probed: https://kernelci.org/test/case/id/618=
9b204d2d0f812d83358ea
        new failure (last pass: v5.15-11396-g61166c09fc60)

    2021-11-08T23:25:33.381818  /lava-58233/1/../bin/lava-test-case
    2021-11-08T23:25:33.382119  <8>[   18.077818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dfail>
    2021-11-08T23:25:33.382276  /lava-58233/1/../bin/lava-test-case
    2021-11-08T23:25:33.382422  <8>[   18.093512] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-driver-present RESULT=3Dpass>
    2021-11-08T23:25:33.382582  /lava-58233/1/../bin/lava-test-case
    2021-11-08T23:25:33.382784  <8>[   18.108504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-probed RESULT=3Dpass>
    2021-11-08T23:25:33.382936  /lava-58233/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3288-rock2-square   | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6189b387376286d9a13358fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-11821=
-ge562220410d1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-11821=
-ge562220410d1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6189b387376286d9a1335=
8fd
        failing since 5 days (last pass: v5.15-2033-g53a1f94bc3ad, first fa=
il: v5.15-5907-g771bcd3baddd) =

 =20
