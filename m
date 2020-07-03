Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9471521349C
	for <lists+linux-next@lfdr.de>; Fri,  3 Jul 2020 09:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgGCHEj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Jul 2020 03:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgGCHEj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Jul 2020 03:04:39 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50422C08C5C1
        for <linux-next@vger.kernel.org>; Fri,  3 Jul 2020 00:04:39 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id o1so5732723plk.1
        for <linux-next@vger.kernel.org>; Fri, 03 Jul 2020 00:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=V3ORJQP0XtZ1DbcjdWVuDN08bD4pVRVOSd8LLJyMseU=;
        b=Uy7hZRhe9ukOzCjl+g2pz5ylUQr3QGttXMZzkeNtln3HMT/EaFSXfjI7jkmn42+IOj
         BeRYofezRYRa9yrmOxRZbBIGGp841gh/qQlUd33f+HFolOVbDol2SMlAiu2dGZeWO94k
         xhSnaJsOZ4/QsJU3t7AwpsAvMcs+ALs800plPdf005AySEFpmnH/KoeNEz3j5xH3fAlg
         uzKzce1LaeOq3BOWJxUiArGmIi7Fc4APndTlV42z5ti0nsH/o1B/elEDMNfWB6Zi3NzH
         7VVb/QSQK48p4X49yZlAjyrTUplbK5drN6RR2MTrktN2lQBYh2rhfNFJicmNxAV6IX00
         VEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=V3ORJQP0XtZ1DbcjdWVuDN08bD4pVRVOSd8LLJyMseU=;
        b=Ru2JdUCRABPYHVWulsNEqJEo69F8LU2A2RrJOXhSdh66xPloBsNZupu9TGpifJh6om
         6KqkeuB10+qCuCLtdvmKpNljcM7h2czCuLPesDin5eYwCAQfieLKTcek+cQA0PZRaUYR
         N8ecRI3A6EAigw7W9JXdmzeNIAyVEtV+lrV90hsfcIZzL38kD00Ce8CXU3gWpDOaYHRn
         kPuiNAUqdyfwO52nb41SuuYPPb+EIAqZ4jgLRBbGmbVVlYsMHLqpL7UojVr0Q+WF/0bq
         sA2IMoo1ag2yxl9rLz0lAMSW1wOvp1Pr1yC0eghtKM3oYD7H5mEEJGU43vN3go54iQSB
         a8JA==
X-Gm-Message-State: AOAM532qugWHQPG1WG3kcPN+lTFBChx0aeEGkLcAqkrHDSrMQhRTZh+i
        KMpyeR5pVGwtwP9mWwMrdw5suVOenug=
X-Google-Smtp-Source: ABdhPJwRUdpr61852y4v9zubCUL590VLH9tyhB09js+AIppGttDim9U8yA9IzBiru+UoZJ0lJILqoA==
X-Received: by 2002:a17:90a:12c7:: with SMTP id b7mr27847965pjg.137.1593759878218;
        Fri, 03 Jul 2020 00:04:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id my9sm10106838pjb.44.2020.07.03.00.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 00:04:37 -0700 (PDT)
Message-ID: <5efed885.1c69fb81.69691.a42b@mx.google.com>
Date:   Fri, 03 Jul 2020 00:04:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-345-g29dbc0a7c3d1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 206 runs,
 3 regressions (v5.8-rc3-345-g29dbc0a7c3d1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 206 runs, 3 regressions (v5.8-rc3-345-g29dbc0a=
7c3d1)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 4/5    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc3-345-g29dbc0a7c3d1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc3-345-g29dbc0a7c3d1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      29dbc0a7c3d1bbca1424f6d85c204ae71b9f10a1 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efea444a563a8bedc85bb2f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-34=
5-g29dbc0a7c3d1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-34=
5-g29dbc0a7c3d1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efea444a563a8be=
dc85bb32
      new failure (last pass: v5.8-rc3-311-g478674402fa5)
      2 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efea5054addcc5bdd85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-34=
5-g29dbc0a7c3d1/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-34=
5-g29dbc0a7c3d1/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efea5054addcc5bdd85b=
b19
      new failure (last pass: v5.8-rc3-311-g478674402fa5) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efea885dc04b1c45e85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-34=
5-g29dbc0a7c3d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-34=
5-g29dbc0a7c3d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efea885dc04b1c45e85b=
b19
      failing since 1 day (last pass: v5.8-rc3-164-g155c91ddae03, first fai=
l: v5.8-rc3-311-g478674402fa5) =20
