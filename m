Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A51487481
	for <lists+linux-next@lfdr.de>; Fri,  7 Jan 2022 10:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbiAGJKV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 Jan 2022 04:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236732AbiAGJKV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jan 2022 04:10:21 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F14C061245
        for <linux-next@vger.kernel.org>; Fri,  7 Jan 2022 01:10:21 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id ie13so4716856pjb.1
        for <linux-next@vger.kernel.org>; Fri, 07 Jan 2022 01:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ooSTM39+fp5hQ36GKX3vll9WKMsYqPNK01QYiA8Q75E=;
        b=Zqx13VzAset9YN4gGd85H5EsHG4+Rsk2yPzqIk5B8h4pu9Fm1UDG/3/b1BTOnNYuCW
         END7V5R8nfXM89/FwHJ6z5gQHqP7C3SBSv9KG8nz7QDsjvxjzCKhFRHOczdVK6V74D2Y
         fODKSorixPqJkNrjaFLrf8yjB911D0N6b79An7mGGWGLmyMlyQrYguE98sKQn9KqKsKj
         a/0FXG6/t0hw0hFiyztx8c+LU6lCAlsQ63D6ljfnjVyz4/dd/J6AxlU9Zb8OF38wAHUe
         2UDrIwWd1l9FlTN4xGAAHoNKty/EZvmKehn9KZLvSX2u7R/G/Id5YK+z2VRvoEsaZtTg
         xSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ooSTM39+fp5hQ36GKX3vll9WKMsYqPNK01QYiA8Q75E=;
        b=g736eWxSHH5PnLgRECLn5vkF/PySv2g3xFf2nrLlNc5+5rDeCm+pBQqaoE4SAERN5m
         e29X/q+ymzN5iSK8mhHu+n1OHGw9OvmUwb8Gnhw3dwq4lYZh30JmDvqVqV44K4XTs1Vf
         LCNhS82MUscSgVOQxHv9t9xyiepgQsdc1LfnRUcbKXY4zyZAcrGaGW3E9dz5PEjA3mPl
         FokHmletPnz7+dsazb6mkYLv37rtukIfDLbJNSlP1If8GoUJSeyoFYBTiZ2wkvK2PLak
         BZOXBNIi0QorrKAsKwFly2ulMf+Ccle/f2u8bUhOcteWGOOTkJ3vLYAuUvAEA7ya8i6h
         SzGQ==
X-Gm-Message-State: AOAM532YPZrntgJHRy6hNqTxcEOtdixEHKdj2CFAhuQuR9Tarn5EoVPE
        mdM6ZUyecII5pB8G4z84/mC+e2R+9ZLHztOh
X-Google-Smtp-Source: ABdhPJwLHcxIdKgPvsdUbeWUQE0pW4XrVfa4lMfsYqMTMEfXd/YwmtublRayG/GW+yNJkzJ3gXVpOg==
X-Received: by 2002:a17:90a:5893:: with SMTP id j19mr14792645pji.30.1641546620731;
        Fri, 07 Jan 2022 01:10:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s9sm5113962pjn.2.2022.01.07.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:10:20 -0800 (PST)
Message-ID: <61d8037c.1c69fb81.a0028.e0ef@mx.google.com>
Date:   Fri, 07 Jan 2022 01:10:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc8-122-g4a9da1f24064
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 451 runs,
 2 regressions (v5.16-rc8-122-g4a9da1f24064)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 451 runs, 2 regressions (v5.16-rc8-122-g4a9da1=
f24064)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
bcm2836-rpi-2-b    | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc8-122-g4a9da1f24064/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc8-122-g4a9da1f24064
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4a9da1f24064c28ad02b99b21ee52a0900c77b5c =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
bcm2836-rpi-2-b    | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d7d4e5213063487bef6748

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
22-g4a9da1f24064/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
22-g4a9da1f24064/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d7d4e5213063487bef6=
749
        failing since 58 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d7d25de11a0915aeef673e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
22-g4a9da1f24064/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
22-g4a9da1f24064/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d7d25de11a0915aeef6=
73f
        new failure (last pass: v5.16-rc8-104-g4774f91d5489) =

 =20
