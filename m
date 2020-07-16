Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E215221B87
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 06:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgGPEpc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 00:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgGPEpc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 00:45:32 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53914C061755
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 21:45:31 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id x8so3325575plm.10
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 21:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UslOGzDSaSWEB3nOnXkLSj0c2xnwDcuyqIJvw0MvFr4=;
        b=ZVQIwN/V6nJjoK4q9bhxuVGzH+aWBrzGBOGH+a4YLXX4ini59NttYYvlk63M4fNZYc
         TlWHcU3SXooKf+T3/MbFtWTVREawvPKmTWxgq1r13YnzF94fvXG3XZ6qqaDfzsOMeBbG
         LNQlYSZ1clAFsNTkNaeSkFF4R/534tYfjjfwTI3tig+y8pKMJ4Thibfk+obP2NVmQR/4
         Nc7coVusDaGlTHng7t1uF1GnRYIwBzWT2ybE1+wvVlH4uxR1WOLLs45EkYkU4mW2lTBR
         lpMKLWc3M/XIGUvvm5J8aGn+8WmbWR6Re//zMjpJmrEMwcQhRER7AWLCYMIduHK7iti5
         vnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UslOGzDSaSWEB3nOnXkLSj0c2xnwDcuyqIJvw0MvFr4=;
        b=o1Y3ekYqP/CfaV1Ss0deDr+udnEX46LUxZpvNdXPSv7D6S9WqnhmPo81QG/MQqGQy7
         jZrN8lExh3yZJssgr86I3WXCZEHZ7UhVjX5KUMUXgFZDuzD0p/u86WlXxUQzZ2zRXXP0
         EB/7vXWhscG4SCRmXkas8NgVcPUtuYBx6mvnU1RxEHS3ZHAmxqW2z9raxCBNaAfPnl1W
         MWNRFFbnSG4WsNw76oe6MVssdwPzW09KWqYAHT+FGLdnBZYjfze8q9kidVIclqqZ+r1s
         qdyoVGiR3GcbA6EU0Fk774f9YONgaTHX2tHCry9mOsvAZUj6hDY8l0spW6zqnkdaDSkS
         z9IA==
X-Gm-Message-State: AOAM531VN03p/4fLUfnUe7Wjg6xw/0Dktwo5y2gG8oK3lsbh+Nc6X8mV
        h9EOG2bK68KGX3tSzCrJ/g5IINjsMBU=
X-Google-Smtp-Source: ABdhPJxAJcko6vHUYoHCaLgUgZItbqGiI7IDMcFKxjmIciI9Wuvi3FruWH1wD+MIJT9h/394khgHzg==
X-Received: by 2002:a17:902:6b03:: with SMTP id o3mr887220plk.69.1594874730234;
        Wed, 15 Jul 2020 21:45:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h100sm3848248pjb.46.2020.07.15.21.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 21:45:29 -0700 (PDT)
Message-ID: <5f0fdb69.1c69fb81.f95a.ac12@mx.google.com>
Date:   Wed, 15 Jul 2020 21:45:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-262-g7be1e4d3000e
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 188 runs,
 5 regressions (v5.8-rc5-262-g7be1e4d3000e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 188 runs, 5 regressions (v5.8-rc5-262-g7be1e4d=
3000e)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =

vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc5-262-g7be1e4d3000e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc5-262-g7be1e4d3000e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7be1e4d3000ef52ab90d0239711df69b881bd807 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0fa1ac4ff2f9adbe85bb29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0fa1ac4ff2f9adbe85b=
b2a
      failing since 71 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0faaba7aaa31f08a85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0faaba7aaa31f08a85b=
b19
      failing since 0 day (last pass: v5.8-rc4-597-gb8976598d3c1, first fai=
l: v5.8-rc5-248-g9259f7ab5c13) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0fa58b172e9b5ee885bb26

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0fa58b172e9b5e=
e885bb29
      failing since 15 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0fa568512d290a0085bb30

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0fa568512d290a=
0085bb33
      failing since 15 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0fa569512d290a0085bb3a

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-26=
2-g7be1e4d3000e/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0fa569512d290a=
0085bb3d
      failing since 15 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =20
