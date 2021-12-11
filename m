Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D25471102
	for <lists+linux-next@lfdr.de>; Sat, 11 Dec 2021 03:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbhLKC5N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Dec 2021 21:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhLKC5M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Dec 2021 21:57:12 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F328EC061714
        for <linux-next@vger.kernel.org>; Fri, 10 Dec 2021 18:53:36 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id g18so10056255pfk.5
        for <linux-next@vger.kernel.org>; Fri, 10 Dec 2021 18:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iF+JU0i62Pu0fLFUQSlBlCiC9BX0s27nYpbbJmqlV5E=;
        b=c0t4uBviJCt9ZDtvXYNhuDJNUDYWSvEQv3l/LCoAZ8UxzMXH2N9HagcElmfhZyBkZJ
         sD56ixKkm2pmRVl78PPLjoHkcUJ7Me+55tCldp2wV4D4UoqKW5IBfPta5uApgJ9f4+dH
         8o60Cn1Bh+bmZQe759HK/y46+77u0aCdbdM6dkHkIVJ4ReFScu4HZyY5d3Vy+2VmmlSY
         0NrF4t8sRVonK6FbwSNzFzZGd+WH2XRlm0dAKxF42mco7wrwtbU/sJPdN5guxdJ86liU
         8ES/MjC8Phlv3flrDwTM8Qh/DCT3mwCrIh9cMly+LPJYAMsbm/WHcT8nvDwVz0pSVaRl
         ja9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iF+JU0i62Pu0fLFUQSlBlCiC9BX0s27nYpbbJmqlV5E=;
        b=tCmgBIFN/9bmG2CWC7jGDka7kjjK37d9y7iw0ofgJO7zefdtG1GTy+gE98lrkTCBuv
         /kLuIetASXglqaw2Jq9GJRW8yXcXLMhO4aWsRfFfH0RAUUZtcYsHoBpkAYGNHDOAFBgp
         wZUCBBnLF0ErWmngvT678nidD2GSt9QYSwG4g6e/ICMBkGF7DiRlBOtZDxWcNvbcvPNq
         18vP26g8vbcovhu8I5I5RnHmnSXQSeUTgHW+Ja0nex/XFMPot2HGOQ34Af++QU6Lw0/S
         y9agIwW7tMTHzlkzoK5Hqxa42y+SbWtgY+wp+c/Aw1VePaQaoGg00wjs8qpp5HiAQ9pq
         454Q==
X-Gm-Message-State: AOAM530J1al4kDXxzjEksTJbGFJkjXyVUkxKx/luxj9GBJYOu7nW7h44
        933ziRP+17yuroJoeP1R1R5LFJDD7YYZeeH6
X-Google-Smtp-Source: ABdhPJzPLJ4GYnGGYmJ3Cj8YlNUcXGQ/6Gh3N+QuyYAxyvKn3cXCMaD/WbtL4Y7Nl5pIeExiIozB/A==
X-Received: by 2002:a05:6a00:ad0:b0:4a3:1056:e2ae with SMTP id c16-20020a056a000ad000b004a31056e2aemr21317900pfl.2.1639191216308;
        Fri, 10 Dec 2021 18:53:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z2sm4601290pff.107.2021.12.10.18.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:53:35 -0800 (PST)
Message-ID: <61b412af.1c69fb81.65632.e8bf@mx.google.com>
Date:   Fri, 10 Dec 2021 18:53:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc4-356-ga119cd39dcbf
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 610 runs,
 3 regressions (v5.16-rc4-356-ga119cd39dcbf)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 610 runs, 3 regressions (v5.16-rc4-356-ga119cd=
39dcbf)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc4-356-ga119cd39dcbf/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc4-356-ga119cd39dcbf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a119cd39dcbf7ff9601d883da1bcaa29e7a33592 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e86ca32d1005ff397121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-3=
56-ga119cd39dcbf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-3=
56-ga119cd39dcbf/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e86ca32d1005ff397=
122
        failing since 30 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3d5e98dd2edaf77397155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-3=
56-ga119cd39dcbf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-3=
56-ga119cd39dcbf/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3d5e98dd2edaf77397=
156
        new failure (last pass: v5.16-rc4-241-g3e464b455df7) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3d892999c978600397138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-3=
56-ga119cd39dcbf/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minn=
owboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-3=
56-ga119cd39dcbf/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minn=
owboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3d892999c978600397=
139
        new failure (last pass: v5.16-rc4-241-g3e464b455df7) =

 =20
