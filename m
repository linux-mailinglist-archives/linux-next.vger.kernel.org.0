Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA3F47701A
	for <lists+linux-next@lfdr.de>; Thu, 16 Dec 2021 12:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbhLPLTX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Dec 2021 06:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbhLPLTW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Dec 2021 06:19:22 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA39C061574
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 03:19:22 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so22361468pjb.1
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 03:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GbLbFPbh8DzE35dql5CLGtnswc2ip32Dd8DshC0XyS8=;
        b=rd4IA/dJtd0DMSS/PVWgZPRtvyxObREC8QMLhVDqF6CbFPAps/UEYwx2jKXCYnsKRU
         HyRWjb9oKrHGzvwC27HQKyTiJFmM8GT8k9xemI2ni/KOpsQWJWGuteAyN5gjJDbpp0Zi
         SFr2OGoev2LK3JzJ5zkJBZRM4u7DeTglBUvw38mqCz1Thdmvb9btUWMuR3Y4Vx4IHV0N
         QUenYvDRlFXqiGhKZ031Z9h7gaLnjdnT3M8CxsURLaHHAsyBDMzaDDDMdu4eoyqjgBDx
         lmM7bk/rsSi+mozRqwZO9iGaQgzMGk4HM5/InqgftkbBRTebGtYvG6nT3VPzq0tIeO7t
         WEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GbLbFPbh8DzE35dql5CLGtnswc2ip32Dd8DshC0XyS8=;
        b=6YrTffdkX9eF5FplqQrqsYLcB0VhpuKlNJeTuJHs6DkfsTlegeerLvgtUYZJEnHjHT
         KqmPfuGtCDTcTr/25kmmB857iqrHtLuTKH/3k+z/P4u7WaHPmz2jaPzogOpc45Sa/b/G
         7u7DPBEPvCxJiKwA2zPt2GRs17OZYJJphIpREHPg33ybowg4ouAW01FiyE0z1VszumQW
         2DzI7OxLR0N1rL7b3i0WRZGE2w+84zu7a4LSCRcMvM2qihzz3qaTs5DPmSIJlchyY8AU
         4dy2RYddYjJ1wvhnmlrMKvNIBYmBBRlyNsQ7k6RAOebwwepWrY5mFHMXY/5E7bO7vM3s
         6+qQ==
X-Gm-Message-State: AOAM530pnMuRSHK3/CsCxbxXRl1K4CJAAjpxFUciqJRLKoy0rHGWJ6Lx
        SaYXAl8sO99BSbD5HTVoBqjMQCL47BBFPi/R
X-Google-Smtp-Source: ABdhPJyNs4Jb3xBjv36fclNLT0sW+cYra8GBurp5//7luYogRz0o2DbpmSrC64ZbuL8lBSyDTHxziw==
X-Received: by 2002:a17:902:9b8f:b0:142:7999:67fb with SMTP id y15-20020a1709029b8f00b00142799967fbmr15491451plp.24.1639653562112;
        Thu, 16 Dec 2021 03:19:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y124sm5087841pgy.86.2021.12.16.03.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:19:21 -0800 (PST)
Message-ID: <61bb20b9.1c69fb81.daf2.dfcc@mx.google.com>
Date:   Thu, 16 Dec 2021 03:19:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-221-g69b486b26c17
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 583 runs,
 5 regressions (v5.16-rc5-221-g69b486b26c17)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 583 runs, 5 regressions (v5.16-rc5-221-g69b486=
b26c17)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =

sun50i-a64-bananapi-m64  | arm64  | lab-clabbe    | gcc-10   | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc5-221-g69b486b26c17/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc5-221-g69b486b26c17
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      69b486b26c1710d7a1bcbafc35534c72b9884a91 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61baf509b6d6eac5b2397150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baf509b6d6eac5b2397=
151
        failing since 36 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae356700b17d7dd39716c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae356700b17d7dd397=
16d
        failing since 2 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.16-rc5-103-g80aa1498c144) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae61244af3f4941397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae61244af3f4941397=
133
        failing since 2 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.16-rc5-103-g80aa1498c144) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61bafb52c378c78263397124

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bafb52c378c78263397=
125
        new failure (last pass: v5.16-rc5-177-g6cfce3d8f89a) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64  | arm64  | lab-clabbe    | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61baec1f1682335a7839711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
21-g69b486b26c17/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baec1f1682335a78397=
120
        new failure (last pass: v5.16-rc5-177-g6cfce3d8f89a) =

 =20
